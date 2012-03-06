/* This code is free software. That means you can redistribute and change it under the terms of the GNU GPL, but there is NO WARRANTY
not even for MERCHANTABILITY or FITNESS for a PARTICULAR PURPOSE. */
SetCompressor "lzma"
!define PRODUCT_NAME "Custom LDraw Pack"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

!include "head.nsh"
!include "MUI.nsh"
!include "ldraw.nsh"
!include "POV-Ray.nsh"
!include "FileAssociation.nsh"
!ifndef LDRAW_NSH_INCLUDED
!error "Please include LDraw.nsh"
!endif
; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ABORTWARNING_TEXT "Are you sure you want to quit the installation of your Custom LDraw Pack?"
;!define MUI_ICON "..\icons\happy.ico"
;!define MUI_UNICON "..\icons\sad.ico"
!define MUI_WELCOMEPAGE_TITLE "Thank you for ordering your custom LDraw pack!"
!define MUI_WELCOMEPAGE_TEXT "This wizard will install your custom LDraw pack for you.\r\n\r\nIt is recommended that you close all other programs before continuing.\r\n\r\nRemember that non CA Parts are not included but can be obtained at LDraw.org\r\n\r\nClick Next to continue."
!define MUI_FINISHPAGE_TEXT "Your Custom LDraw Pack has been installed on your computer.\r\n\r\nClick Finish to close this wizard."

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; Directory page
!define MUI_PAGE_HEADER_SUBTEXT "Choose the directory to install your custom LDraw Package"
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"


; MUI end ------
Name "${PRODUCT_NAME}"
OutFile "..\${THREELET}ldr.exe"
InstallDir "$PROGRAMFILES\LDraw"
ShowInstDetails hide
ShowUnInstDetails hide
BrandingText "The Custom LDraw Wizard"
Dirtext "Setup will install your Custom LDraw Pack to the following folder. To install to a different folder, click Browse and select another folder. Click install to start the installation."
Caption "Custom LDraw Pack Setup"


Section "MainSection" SEC01
SetOutPath "$INSTDIR"
!insertmacro parts
!include "features.nsh"

${POV-Ray}
SectionEnd

Section -AdditionalIcons
  SetOutPath $INSTDIR
  CreateDirectory "$SMPROGRAMS\LDraw"
  CreateShortCut "$SMPROGRAMS\LDraw\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  ${RegisterExtension} "$INSTDIR\${LDR_EXT}" ".ldr" "LDraw Project"
  ${RegisterExtension} "$INSTDIR\${LDR_EXT}" ".mpd" "LDraw Project"
SectionEnd


Function un.onUninstSuccess
  HideWindow
    MessageBox MB_ICONINFORMATION|MB_OK "Your custom LDraw pack was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove your custom LDraw pack?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  !insertmacro lduninst
  Delete "$INSTDIR\uninst.exe"
  Delete "$SMPROGRAMS\LDraw\Uninstall.lnk"

  RMDir "$SMPROGRAMS\LDraw"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  ${UnRegisterExtension} ".ldr" "LDraw Project"
  ${UnRegisterExtension} ".mpd" "LDraw Project"
  SetAutoClose true
SectionEnd
