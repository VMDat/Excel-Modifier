import os
import sys
import subprocess

def run_app():
    if getattr(sys, 'frozen', False):
        # Chế độ đã đóng gói
        app_path = os.path.dirname(sys.executable)
        bin_name = "CSVProcessor.exe" if os.name == "nt" else "CSVProcessor"
        subprocess.run([os.path.join(app_path, bin_name)])
    else:
        # Chế độ development
        subprocess.run(["streamlit", "run", "src/app.py"])

if __name__ == "__main__":
    run_app()