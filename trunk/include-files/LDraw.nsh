/*  The Custom LDraw Wizard (CLP Header)
    Copyright (C) 2012  Seth Schroeder

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

    Email me at developer@sethradio.com  */
!ifndef LDRAW_NSH_INCLUDED
!define LDRAW_NSH_INCLUDED


!macro parts
File "${ENVDIR}\parts.7z"
Nsis7z::ExtractWithDetails "parts.7z" "Extracting Parts Archive %s..."
Delete "$INSTDIR\parts.7z"
DetailPrint "Launching MKlist..."
SetDetailsPrint none
ExecWait "$INSTDIR\mklist.exe -n"
SetDetailsPrint both
!define parts
!macroend

!macro mlcad
File "${ENVDIR}\MLCAD.exe"
File "${ENVDIR}\mlcad.dll"
File "${ENVDIR}\MLCad.ini"
File "${ENVDIR}\MLCad-readme.txt"
CreateShortCut "$SMPROGRAMS\LDraw\MLCad.lnk" "$INSTDIR\MLCAD.exe"
!define mlcad
!macroend

!macro leocad
File "${ENVDIR}\pieces.bin"
File "${ENVDIR}\textures.bin"
File "${ENVDIR}\LeoCAD-ReadMe.txt"
File "${ENVDIR}\LEOCAD.HLP"
File "${ENVDIR}\leocad.cnt"
File "${ENVDIR}\pieces.idx"
File "${ENVDIR}\textures.idx"
File "${ENVDIR}\sysfont.txf"
File "${ENVDIR}\LeoCAD.exe"
CreateShortCut "$SMPROGRAMS\LDraw\LeoCAD.lnk" "$INSTDIR\LeoCAD.exe"
${RegisterExtension} "$INSTDIR\LeoCAD.exe" ".lcd" "LeoCAD Project"
!define leocad
!macroend

!macro ldview
File "${ENVDIR}\LGEO.xml"
File "${ENVDIR}\ChangeHistory.html"
;File "${ENVDIR}\LDView-readme.txt"
File "${ENVDIR}\LDView.hlp"
File "${ENVDIR}\LDView.exe"
CreateShortCut "$SMPROGRAMS\LDraw\LDView.lnk" "$INSTDIR\LDView.exe"
!define ldview 
!macroend

!macro l3lab
File "${ENVDIR}\L3Lab.exe"
CreateShortCut "$SMPROGRAMS\LDraw\L3Lab.lnk" "$INSTDIR\L3Lab.exe"
!define l3lab 
!macroend

!macro lpub
File "${ENVDIR}\lpub.exe"
File "${ENVDIR}\LPub.ico"
File "${ENVDIR}\libgcc_s_dw2-1.dll"
File "${ENVDIR}\mingwm10.dll"
File "${ENVDIR}\QtCore4.dll"
File "${ENVDIR}\QtGui4.dll"
CreateShortCut "$SMPROGRAMS\LDraw\LPub.lnk" "$INSTDIR\lpub.exe" "" "$INSTDIR\LPub.ico" "" ""
!define lpub 
!macroend

!macro stickgen
File "${ENVDIR}\Sticker_Generator.exe"
SetOutPath "$INSTDIR\Settings"
File "${ENVDIR}\Settings\config.txt"
File "${ENVDIR}\Settings\English.txt"
File "${ENVDIR}\Settings\Log_File.txt"
SetOutPath "$INSTDIR"
CreateShortCut "$SMPROGRAMS\LDraw\Sticker Generator.lnk" "$INSTDIR\Sticker_Generator.exe"
!define stickgen 
!macroend

!macro l3p
File "${ENVDIR}\L3P.EXE"
!define l3p 
!macroend

!macro lsynth
SetOutPath "$INSTDIR\bin"
File "${ENVDIR}\bin\lsynthcp.exe"
File "${ENVDIR}\bin\lsynth.mpd"
SetOutPath "$INSTDIR"
!define lsynth 
!macroend

!macro ldlite
File "${ENVDIR}\ldlite.exe"
File "${ENVDIR}\ldlite-readme.html"
CreateShortCut "$SMPROGRAMS\LDraw\LDlite.lnk" "$INSTDIR\ldlite.exe"
!define ldlite 
!macroend

!macro lduninst
!ifdef parts
!include "unparts.nsh"
!endif

!ifdef mlcad
Delete "$INSTDIR\mlcad.dll"
Delete "$INSTDIR\MLCAD.exe"
Delete "$INSTDIR\MLCad.ini"
Delete "$INSTDIR\MLCad-readme.txt"
Delete "$SMPROGRAMS\LDraw\MLCad.lnk"
!endif

!ifdef leocad
Delete "$INSTDIR\pieces.bin"
Delete "$INSTDIR\textures.bin"
Delete "$INSTDIR\LeoCAD-ReadMe.txt"
Delete "$INSTDIR\LEOCAD.HLP"
Delete "$INSTDIR\leocad.cnt"
Delete "$INSTDIR\pieces.idx"
Delete "$INSTDIR\textures.idx"
Delete "$INSTDIR\sysfont.txf"
Delete "$INSTDIR\LeoCAD.exe"
Delete "$SMPROGRAMS\LDraw\LeoCAD.lnk"
${UnRegisterExtension} ".lcd" "LeoCAD Project"
!endif

!ifdef ldview
Delete "$INSTDIR\LGEO.xml"
Delete "$INSTDIR\ChangHistory.html"
Delete "$INSTDIR\LDView-readme.txt"
Delete "$INSTDIR\LDView.hlp"
Delete "$INSTDIR\LDView.exe"
Delete "$SMPROGRAMS\LDraw\LDView.lnk"
!endif

!ifdef l3lab
Delete "$INSTDIR\L3Lab.exe"
Delete "$SMPROGRAMS\LDraw\L3Lab.lnk"
!endif

!ifdef lpub
Delete "$INSTDIR\lpub.exe"
Delete "$INSTDIR\LPub.ico"
Delete "$INSTDIR\libgcc_s_dw2-1.dll"
Delete "$INSTDIR\mingwm10.dll"
Delete "$INSTDIR\QtCore4.dll"
Delete "$INSTDIR\QtGui4.dll"
Delete "$SMPROGRAMS\LDraw\LPub.lnk"
!endif

!ifdef stickgen
Delete "$INSTDIR\Sticker_Generator.exe"
Delete "$INSTDIR\Settings\config.txt"
Delete "$INSTDIR\Settings\English.txt"
Delete "$INSTDIR\Settings\Log_File.txt"
Delete "$SMPROGRAMS\LDraw\Sticker Generator.lnk"
RmDir "$INSTDIR\Settings"
!endif

!ifdef l3p
Delete "$INSTDIR\L3P.EXE"
!endif

!ifdef lsynth
Delete "$INSTDIR\bin\lsynthcp.exe"
Delete "$INSTDIR\bin\lsynth.mpd"
RmDir "$INSTDIR\bin"
!endif

!ifdef ldlite
Delete "$INSTDIR\ldlite.exe"
Delete "$INSTDIR\ldlite-readme.html"
Delete "$SMPROGRAMS\LDraw\LDlite.lnk"
!endif
!macroend

!endif
