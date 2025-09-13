#!/bin/sh
set -euo pipefail

cd /src
echo "Python version in container:"
python --version || true

echo "Installing requirements..."
pip install --no-cache-dir -r docker/requirements.txt

echo "Running PyInstaller for Windows..."
pyinstaller \
  --clean \
  --noconfirm \
  --onefile \
  --name CSVProcessor \
  --windowed \
  --hidden-import pandas \
  --hidden-import numpy \
  --hidden-import openpyxl \
  --hidden-import streamlit \
  --distpath /src/dist/windows \
  --workpath /src/build/windows \
  --specpath /src/build/windows \
  src/app.py

echo "Build finished. Artifacts in /src/dist/windows"




