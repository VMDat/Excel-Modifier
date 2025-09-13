!include MUI2.nsh

Name "CSV Processor"
OutFile "CSVProcessor_Setup.exe"
InstallDir "$PROGRAMFILES\CSVProcessor"

!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_LANGUAGE "English"

Section
    SetOutPath $INSTDIR
    File /r "..\..\dist\windows\*"
    
    CreateShortCut "$SMPROGRAMS\CSV Processor.lnk" "$INSTDIR\CSVProcessor.exe"
    CreateShortCut "$DESKTOP\CSV Processor.lnk" "$INSTDIR\CSVProcessor.exe"
    
    WriteUninstaller "$INSTDIR\Uninstall.exe"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CSVProcessor" \
        "DisplayName" "CSV Processor"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CSVProcessor" \
        "UninstallString" "$\"$INSTDIR\Uninstall.exe$\""
SectionEnd

Section "Uninstall"
    Delete "$INSTDIR\*"
    RMDir /r "$INSTDIR"
    
    Delete "$SMPROGRAMS\CSV Processor.lnk"
    Delete "$DESKTOP\CSV Processor.lnk"
    
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CSVProcessor"
SectionEnd