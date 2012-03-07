/*  The Custom LDraw Wizard (Create custom LDraw installers.)
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

!include "MUI.nsh"
!include "LogicLib.nsh"

Outfile "CLPG.exe"
InstallButtonText "Generate"
Page Custom Page1
Page Custom Page2 Page2Leave
Page Custom Page3
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_LANGUAGE "English"
Var Name
Var mlcad
Var leocad
Var ldview
Var l3lab
Var ldlite
Var lpub
Var lsynth
Var stickgen
Var l3p
Var Comp
Var Comment
Var Pov31
Var Pov35
Var Pov36
Var Pov64
Function Page1
  ReserveFile "Page1.ini"
  !insertmacro MUI_INSTALLOPTIONS_EXTRACT "Page1.ini"
  !insertmacro MUI_INSTALLOPTIONS_DISPLAY "Page1.ini"
  !insertmacro MUI_INSTALLOPTIONS_READ $Name "Page1.ini" "Field 3" "State"
  !insertmacro MUI_INSTALLOPTIONS_READ $Comp "Page1.ini" "Field 5" "State"
  !insertmacro MUI_INSTALLOPTIONS_READ $Comment "Page1.ini" "Field 7" "State"
FunctionEnd

Function Page2
   ReserveFile "Page2.ini"
   !insertmacro MUI_INSTALLOPTIONS_EXTRACT "Page2.ini"
   !insertmacro MUI_INSTALLOPTIONS_DISPLAY "Page2.ini"
FunctionEnd

Function Page2Leave
   !insertmacro MUI_INSTALLOPTIONS_READ $mlcad "Page2.ini" "Field 2" "State"
   !insertmacro MUI_INSTALLOPTIONS_READ $leocad "Page2.ini" "Field 3" "State"
   !insertmacro MUI_INSTALLOPTIONS_READ $ldview "Page2.ini" "Field 5" "State"
   !insertmacro MUI_INSTALLOPTIONS_READ $l3lab "Page2.ini" "Field 6" "State"
   !insertmacro MUI_INSTALLOPTIONS_READ $ldlite "Page2.ini" "Field 7" "State"
   !insertmacro MUI_INSTALLOPTIONS_READ $lpub "Page2.ini" "Field 9" "State"
   !insertmacro MUI_INSTALLOPTIONS_READ $lsynth "Page2.ini" "Field 10" "State"
   !insertmacro MUI_INSTALLOPTIONS_READ $stickgen "Page2.ini" "Field 11" "State"
   !insertmacro MUI_INSTALLOPTIONS_READ $l3p "Page2.ini" "Field 12" "State"
FunctionEnd

Function Page3
   ReserveFile "Page3.ini"
   !insertmacro MUI_INSTALLOPTIONS_EXTRACT "Page3.ini"
   !insertmacro MUI_INSTALLOPTIONS_DISPLAY "Page3.ini"
   !insertmacro MUI_INSTALLOPTIONS_READ $Pov31 "Page3.ini" "Field 2" "State"
   !insertmacro MUI_INSTALLOPTIONS_READ $Pov35 "Page3.ini" "Field 3" "State"
   !insertmacro MUI_INSTALLOPTIONS_READ $Pov36 "Page3.ini" "Field 4" "State"
   !insertmacro MUI_INSTALLOPTIONS_READ $Pov64 "Page3.ini" "Field 5" "State"
FunctionEnd

Section

FileOpen $1 "head.nsh" w
   FileWrite $1 "!define PACKAGE_NAME $\"$Name$\""
   FileWrite $1 "$\r$\n!define COMPANY $\"$Comp$\""
   FileWrite $1 "$\r$\n!define COMMENT $\"$Comment$\""
FileClose $1
FileOpen $0 "features.nsh" w
   ${Switch} $mlcad
      ${Case} '1'
         
         FileWrite $0 "!insertmacro mlcad"

      ${break}
   ${EndSwitch}
   
   ${Switch} $leocad
      ${Case} '1'
         FileWrite $0 "$\r$\n!insertmacro leocad"

      ${break}
   ${EndSwitch}
   
${Switch} $ldview
      ${Case} '1'
         FileWrite $0 "$\r$\n!insertmacro ldview"

      ${break}
   ${EndSwitch}
   
${Switch} $l3lab
      ${Case} '1'
         FileWrite $0 "$\r$\n!insertmacro l3lab"

      ${break}
   ${EndSwitch}
   
${Switch} $ldlite
      ${Case} '1'
         FileWrite $0 "$\r$\n!insertmacro ldlite"

      ${break}
   ${EndSwitch}
   
${Switch} $lpub
      ${Case} '1'
         FileWrite $0 "$\r$\n!insertmacro lpub"

      ${break}
   ${EndSwitch}
   
${Switch} $lsynth
      ${Case} '1'
         FileWrite $0 "$\r$\n!insertmacro lsynth"

      ${break}
   ${EndSwitch}
   
${Switch} $stickgen
      ${Case} '1'
         FileWrite $0 "$\r$\n!insertmacro stickgen"

      ${break}
   ${EndSwitch}
   
${Switch} $l3p
      ${Case} '1'
         FileWrite $0 "$\r$\n!insertmacro l3p"

      ${break}
   ${EndSwitch}
   
   
${Switch} $Pov31
      ${Case} '1'
         FileWrite $0 "$\r$\n!insertmacro pov-31"

      ${break}
   ${EndSwitch}
   
${Switch} $Pov35
      ${Case} '1'
         FileWrite $0 "$\r$\n!insertmacro pov-35"

      ${break}
   ${EndSwitch}
   
${Switch} $Pov36
      ${Case} '1'
         FileWrite $0 "$\r$\n!insertmacro pov-36"

      ${break}
   ${EndSwitch}
   
${Switch} $Pov64
      ${Case} '1'
         FileWrite $0 "$\r$\n!insertmacro pov-36-64"

      ${break}
   ${EndSwitch}
   FileClose $0
SectionEnd