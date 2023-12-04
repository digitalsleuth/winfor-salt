# Name: nuget
# Website: https://www.nuget.org/
# Description: PowerShell Package Manager
# Category: Requirements
# Author: Microsoft
# License: Apache v2.0 (https://github.com/NuGet/NuGet.Client/blob/dev/LICENSE.txt)
# Version: 2.8.5.208
# Notes:

nuget-install:
  cmd.run:
    - name: 'Install-PackageProvider -Name Nuget -MinimumVersion "2.8.5.208" -Force'
    - shell: powershell
