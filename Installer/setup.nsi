; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "The Custom LDraw Wizard"
!define PRODUCT_VERSION "0.3"
!define PRODUCT_PUBLISHER "Seth Schroeder"
!define PRODUCT_WEB_SITE "http://sethradio.com/projects/the-custom-ldraw-wizard"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\CLPG.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

SetCompressor lzma

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "..\icons\happy.ico"
!define MUI_UNICON "..\icons\sad.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "..\License.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Start menu page
var ICONS_GROUP
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "The Custom LDraw Wizard"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"
!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\bin\CLPG.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; Reserve files
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"

OutFile "CLW_Setup.exe"
InstallDir "$PROGRAMFILES\The Custom LDraw Wizard"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "MainSection" SEC01
  SetOutPath "$INSTDIR\bin"
  SetOverwrite on
  File "..\CLPG.exe"
  IfFileExists "$PROGRAMFILES\NSIS\NSIS.exe" +3 0
  NSISdl::download "http://the-custom-ldraw-wizard.googlecode.com/svn/tags/0.3/download-files/nsis-2.46-setup.exe" "nsis-2.46-setup.exe"
  ExecWait "$INSTDIR\bin\nsis-2.46-setup.exe"
  Delete "$INSTDIR\bin\nsis-2.46-setup.exe"
  FileOpen $0 "$PROGRAMFILES\NSIS\nsisconf.nsh" w
  FileWrite $0 "!define ENVDIR $\"$INSTDIR\programs$\""
  FileClose $0
  SetOutPath "$PROGRAMFILES\NSIS\Include"
  File "..\include-files\unparts.nsh"
  File "..\include-files\POV-Ray.nsh"
  File "..\include-files\LDraw.nsh"
  SetOutPath "$PROGRAMFILES\Plugins"
  NSISdl::download "http://the-custom-ldraw-wizard.googlecode.com/svn/tags/0.3/download-files/Nsis7z.dll" "Nsis7z.dll"
  SetOutPath "$INSTDIR\programs"
  NSISdl::download "http://the-custom-ldraw-wizard.googlecode.com/svn/tags/0.3/download-files/programs.7z" "programs.7z"
  Nsis7z::ExtractWithDetails "programs.7z" "Extracting Programs %s..."
  SetOutPath "$INSTDIR\template"
  File "..\template\template.nsi"
; Shortcuts
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\The Custom LDraw Wizard.lnk" "$INSTDIR\bin\CLPG.exe"
  CreateShortCut "$DESKTOP\The Custom LDraw Wizard.lnk" "$INSTDIR\bin\CLPG.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
  SetOutPath "$INSTDIR"
SectionEnd

Section -AdditionalIcons
  SetOutPath $INSTDIR
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk" "$INSTDIR\uninst.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\bin\CLPG.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\bin\CLPG.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  !insertmacro MUI_STARTMENU_GETFOLDER "Application" $ICONS_GROUP
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\bin\LDraw.nsh"
  Delete "$INSTDIR\bin\POV-Ray.nsh"
  Delete "$INSTDIR\bin\unparts.nsh"
  Delete "$INSTDIR\bin\CLPG.exe"

  Delete "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Website.lnk"
  Delete "$DESKTOP\The Custom LDraw Wizard.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\The Custom LDraw Wizard.lnk"

  RMDir "$SMPROGRAMS\$ICONS_GROUP"
  RMDir "$INSTDIR\bin"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd