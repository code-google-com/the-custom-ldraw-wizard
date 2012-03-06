/* This code is free software. That means you can redistribute and change it under the terms of the GNU GPL, but there is NO WARRANTY
not even for MERCHANTABILITY or FITNESS for a PARTICULAR PURPOSE. */

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
Function Page1
  ReserveFile "Page1.ini"
  !insertmacro MUI_INSTALLOPTIONS_EXTRACT "Page1.ini"
  !insertmacro MUI_INSTALLOPTIONS_DISPLAY "Page1.ini"
  !insertmacro MUI_INSTALLOPTIONS_READ $Name "Page1.ini" "Field 3" "State"
  !insertmacro MUI_INSTALLOPTIONS_READ $Comp "Page1.ini" "Field 5" "State"
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

FunctionEnd

Section

FileOpen $1 "head.nsh" w
   FileWrite $1 "!define PACKAGE_NAME $\"$Name$\""
   FileWrite $1 "$\r$\n!define COMPANY $\"$Comp$\""
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
   FileClose $0
SectionEnd