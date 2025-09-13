### Command line:

To export .exe file:
\Excel-Modifier-main>%PY% -m PyInstaller --noconfirm --onefile --name CSVPrcessor --add-data "src;src" --copy-metadata streamlit --collect-data streamlit --copy-metadata pandas --copy-metadata openpyxl --copy-metadata numpy entrypoint.py

dist\CSVPrcessor.exe


### For any laptop with just double click into CSVPrcessor.exe
Please do this once:
1. Win+R -> paste %USERPROFILE% -> Enter
2. Create new folder: .streamlit (if not existed)
3. Open .streamlit -> Right click -> New -> Text Document -> Rename: config.toml
4. Open config.toml by Notepadm paste below content then Save:
```bash
[global]
developmentMode = false

[browser]
gatherUsageStats = false

[server]
address = "localhost"
port = 8505
headless = false
```
5. Close Notepad, double click CSVPrcessor.exe and access http://localhost:8505
