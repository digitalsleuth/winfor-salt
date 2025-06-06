# Name: Windows Sandbox
# Website: https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-sandbox/windows-sandbox-overview
# Description: Windows-based Sandbox Environment
# Category: Executables
# Author: Microsoft
# License: 
# Version: 10.0.19041.985
# Notes: 

windows-sandbox:
  cmd.run:
    - name: 'dism /online /quiet /norestart /Enable-Feature /FeatureName:Containers-DisposableClientVM /all'
    - shell: cmd
    - success_retcodes: 3010
