import os
import platform
import subprocess
import shutil

def build_windows():
    print("Building Windows installer...")
    os.chdir("docker")
    try:
        # Build Docker image
        subprocess.run([
            "docker", "build", 
            "--target", "windows-builder",
            "-t", "csv-windows-builder", 
            "."
        ], check=True)
        
        # Copy build artifacts
        os.makedirs("../dist/windows", exist_ok=True)
        subprocess.run([
            "docker", "run", "--rm",
            "-v", f"{os.getcwd()}/../dist/windows:/dist",
            "csv-windows-builder",
            "cp", "-r", "/app/dist/.", "/dist"
        ], check=True)
        
        # Move to installer directory
        os.chdir("../installer/windows")
        subprocess.run(["powershell", "-File", "build_installer.ps1"], check=True)
        
    except subprocess.CalledProcessError as e:
        print(f"Build failed: {e}")
    finally:
        os.chdir("../..")

def build_linux():
    print("Building Linux package...")
    try:
        # Build Docker image
        subprocess.run([
            "docker", "build",
            "--target", "linux-builder",
            "-t", "csv-linux-builder",
            "."
        ], cwd="docker", check=True)
        
        # Create output directory
        os.makedirs("dist/linux", exist_ok=True)
        
        # Run container and copy artifacts
        subprocess.run([
            "docker", "run", "--rm",
            "-v", f"{os.getcwd()}/dist/linux:/dist",
            "csv-linux-builder",
            "cp", "-r", "/app/dist/.", "/dist"
        ], check=True)
        
        print("Build completed successfully!")
        print("Linux executable: dist/linux/csv-processor")
        
    except subprocess.CalledProcessError as e:
        print(f"Linux build failed: {e}")
        print("Make sure Docker is installed and running")
        print("Try: sudo systemctl start docker")

def build_mac():
    print("macOS build not implemented yet")

if __name__ == "__main__":
    system = platform.system()
    print(f"Building for: {system}")
    
    # Clean previous builds
    if os.path.exists("dist"):
        shutil.rmtree("dist")
    
    if system == "Windows":
        build_windows()
    elif system == "Darwin":
        build_mac()
    elif system == "Linux":
        build_linux()
    else:
        print(f"Unsupported platform: {system}")