/* This code is free software. That means you can redistribute and change it under the terms of the GNU GPL, but there is NO WARRANTY
not even for MERCHANTABILITY or FITNESS for a PARTICULAR PURPOSE. */
SetCompressor "lzma"
!include "head.nsh"
!define PRODUCT_NAME "${PACKAGE_NAME}"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define LDR_EXT "MLCAD.exe"

!include "MUI.nsh"
!include "ldraw.nsh"
!include "POV-Ray.nsh"
!include "FileAssociation.nsh"
!ifndef LDRAW_NSH_INCLUDED
!error "Please include LDraw.nsh"
!endif
; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ABORTWARNING_TEXT "Are you sure you want to quit the installation of ${PACKAGE_NAME}?"
;!define MUI_ICON "..\icons\happy.ico"
;!define MUI_UNICON "..\icons\sad.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; Directory page
!define MUI_PAGE_HEADER_SUBTEXT "Choose the directory to install ${PACKAGE_NAME}"
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
OutFile "${PACKAGE_NAME}.exe"
InstallDir "$PROGRAMFILES\LDraw"
ShowInstDetails hide
ShowUnInstDetails hide
BrandingText "The Custom LDraw Wizard"
VIProductVersion "1.0.0.0"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${PRODUCT_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "${COMMENT}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "${COMPANY}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${PRODUCT_NAME}"

Section "MainSection" SEC01
SetOutPath "$INSTDIR"
!insertmacro parts
!include "features.nsh"

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
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment" "LDRAWDIR" '$INSTDIR'
SectionEnd


Function un.onUninstSuccess
  HideWindow
    MessageBox MB_ICONINFORMATION|MB_OK "${PACKAGE_NAME} was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove ${PACKAGE_NAME}?" IDYES +2
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
