$MAKENSIS_PATH = "C:\Program Files (x86)\NSIS\makensis.exe"

if (-not (Test-Path $MAKENSIS_PATH)) {
    Write-Host "NSIS not found! Installing..."
    # Tự động cài đặt NSIS nếu chưa có
    Invoke-WebRequest -Uri "https://nchc.dl.sourceforge.net/project/nsis/NSIS%203/3.08/nsis-3.08-setup.exe" -OutFile "nsis-installer.exe"
    Start-Process -Wait -FilePath ".\nsis-installer.exe" -ArgumentList "/S"
}

& $MAKENSIS_PATH "/XOutFile ..\..\..\dist\CSVProcessor_Setup.exe" "setup.nsi"