#!/bin/bash

# Create package structure
PKG_DIR="csv-processor_1.0_amd64"
mkdir -p ${PKG_DIR}/usr/local/bin
mkdir -p ${PKG_DIR}/usr/share/applications

# Copy binary
cp ../../../dist/linux/csv-processor ${PKG_DIR}/usr/local/bin/

# Create desktop file
cat > ${PKG_DIR}/usr/share/applications/csv-processor.desktop <<EOL
[Desktop Entry]
Name=CSV Processor
Exec=/usr/local/bin/csv-processor
Icon=system-file-manager
Type=Application
Categories=Utility;
EOL

# Create DEBIAN control file
mkdir -p ${PKG_DIR}/DEBIAN
cat > ${PKG_DIR}/DEBIAN/control <<EOL
Package: csv-processor
Version: 1.0
Architecture: amd64
Maintainer: Your Name <you@example.com>
Description: CSV Processing Tool
 A tool for processing CSV files and exporting to Excel.
EOL

# Build package
dpkg-deb --build ${PKG_DIR}
mv ${PKG_DIR}.deb ../../../dist/linux/

echo "Linux package built: dist/linux/${PKG_DIR}.deb"