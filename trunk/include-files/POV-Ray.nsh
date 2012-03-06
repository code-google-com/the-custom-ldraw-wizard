/*POV-Ray header*/

!macro pov-31
File "${ENVDIR}\povs\povwin31.exe"
DetailPrint "Launching POV-Ray Installer..."
SetDetailsPrint none
ExecWait "$INSTDIR\povwin31.exe"
Delete "$INSTDIR\povwin31.exe"
SetDetailsPrint both
!macroend

!macro pov-35
File "${ENVDIR}\povs\povwin35.exe"
DetailPrint "Launching POV-Ray Installer..."
SetDetailsPrint none
ExecWait "$INSTDIR\povwin35.exe"
Delete "$INSTDIR\povwin35.exe"
SetDetailsPrint both
!macroend

!macro pov-36
File "${ENVDIR}\povs\povwin36.msi"
DetailPrint "Launching POV-Ray Installer..."
SetDetailsPrint none
ExecWait '"msiexec" /i "$INSTDIR\povwin36.msi"'
Delete "$INSTDIR\povwin36.msi"
SetDetailsPrint both
!macroend

!macro pov-36-64
File "${ENVDIR}\povs\povwin36-64.msi"
DetailPrint "Launching POV-Ray Installer..."
SetDetailsPrint none
ExecWait '"msiexec" /i "$INSTDIR\povwin36-64.msi"'
Delete "$INSTDIR\povwin36-64.msi"
SetDetailsPrint both
!macroend