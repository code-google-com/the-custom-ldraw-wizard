/*  The Custom LDraw Wizard (POV-Ray header)
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