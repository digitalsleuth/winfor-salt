directory-shell-posh-admin:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\shell\PoshAsAdmin
    - vtype: REG_SZ
    - vdata: "Open PowerShell Prompt here as Administrator"

directory-shell-posh-admin-icon:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\shell\PoshAsAdmin
    - vname: Icon
    - vtype: REG_SZ
    - vdata: powershell.exe

directory-shell-posh-admin-shield:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\shell\PoshAsAdmin
    - vname: HasLUAShield
    - vtype: REG_SZ

directory-shell-posh-admin-command:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\shell\PoshAsAdmin\command
    - vtype: REG_SZ
    - vdata: "powershell -W 1 -nop -c \"SaPs -Verb RunAs powershell.exe -Args \\\"-noe -c Push-Location \\\\\\\"\\\"%V/\\\\\\\"\\\"\\\""

directory-background-shell-posh:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\Background\shell\PoshAsAdmin
    - vtype: REG_SZ
    - vdata: "Open PowerShell Prompt here as Administrator"

directory-background-shell-posh-icon:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\Background\shell\PoshAsAdmin
    - vname: Icon
    - vtype: REG_SZ
    - vdata: powershell.exe

directory-background-shell-posh-shield:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\Background\shell\PoshAsAdmin
    - vname: HasLUAShield
    - vtype: REG_SZ

directory-background-shell-posh-command:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\Background\shell\PoshAsAdmin\command
    - vtype: REG_SZ
    - vdata: "powershell -W 1 -nop -c \"SaPs -Verb RunAs powershell.exe -Args \\\"-noe -c Push-Location \\\\\\\"\\\"%V/\\\\\\\"\\\"\\\""

drive-shell-posh-admin:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Drive\shell\PoshAsAdmin
    - vtype: REG_SZ
    - vdata: "Open PowerShell Prompt here as Administrator"

drive-shell-posh-icon:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Drive\shell\PoshAsAdmin
    - vname: Icon
    - vtype: REG_SZ
    - vdata: powershell.exe

drive-shell-posh-shield:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Drive\shell\PoshAsAdmin
    - vname: HasLUAShield
    - vtype: REG_SZ

drive-shell-posh-command:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Drive\shell\PoshAsAdmin\command
    - vtype: REG_SZ
    - vdata: "powershell -W 1 -nop -c \"SaPs -Verb RunAs powershell.exe -Args \\\"-noe -c Push-Location \\\\\\\"\\\"%V/\\\\\\\"\\\"\\\""

library-background-shell-posh:
  reg.present:
    - name: HKEY_CLASSES_ROOT\LibraryFolder\background\shell\PoshAsAdmin
    - vtype: REG_SZ
    - vdata: "Open PowerShell Prompt here as Administrator"

library-background-shell-posh-icon:
  reg.present:
    - name: HKEY_CLASSES_ROOT\LibraryFolder\background\shell\PoshAsAdmin
    - vname: Icon
    - vtype: REG_SZ
    - vdata: powershell.exe

library-background-shell-posh-shield:
  reg.present:
    - name: HKEY_CLASSES_ROOT\LibraryFolder\background\shell\PoshAsAdmin
    - vname: HasLUAShield
    - vtype: REG_SZ

library-background-shell-posh-command:
  reg.present:
    - name: HKEY_CLASSES_ROOT\LibraryFolder\background\shell\PoshAsAdmin\command
    - vtype: REG_SZ
    - vdata: "powershell -W 1 -nop -c \"SaPs -Verb RunAs powershell.exe -Args \\\"-noe -c Push-Location \\\\\\\"\\\"%V/\\\\\\\"\\\"\\\""

linked-connections-posh:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
    - vname: EnableLinkedConnections
    - vtype: REG_DWORD
    - vdata: 1

