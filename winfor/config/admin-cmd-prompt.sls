directory-shell-admin:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\shell\CmdAsAdmin
    - vtype: REG_SZ
    - vdata: "Open Command Prompt here as Administrator"

directory-shell-admin-icon:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\shell\CmdAsAdmin
    - vname: Icon
    - vtype: REG_SZ
    - vdata: cmd.exe

directory-shell-admin-shield:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\shell\CmdAsAdmin
    - vname: HasLUAShield
    - vtype: REG_SZ

directory-shell-admin-command:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\shell\CmdAsAdmin\command
    - vtype: REG_SZ
    - vdata: "cmd /c echo|set/p=\"%L\"|powershell -nop -W 1 -noni -nol \"SaPs 'cmd' -Args '/c \"\"\"cd /d',$([char]34+$Input+[char]34),'^&^& start /b cmd.exe\"\"\"' -Verb RunAs\""

directory-background-shell:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\Background\shell\CmdAsAdmin
    - vtype: REG_SZ
    - vdata: "Open Command Prompt here as Administrator"

directory-background-shell-icon:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\Background\shell\CmdAsAdmin
    - vname: Icon
    - vtype: REG_SZ
    - vdata: cmd.exe

directory-background-shell-shield:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\Background\shell\CmdAsAdmin
    - vname: HasLUAShield
    - vtype: REG_SZ

directory-background-shell-command:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\Background\shell\CmdAsAdmin\command
    - vtype: REG_SZ
    - vdata: "cmd /c echo|set/p=\"%L\"|powershell -nop -W 1 -noni -nol \"SaPs 'cmd' -Args '/c \"\"\"cd /d',$([char]34+$Input+[char]34),'^&^& start /b cmd.exe\"\"\"' -Verb RunAs\""

drive-shell-admin:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Drive\shell\CmdAsAdmin
    - vtype: REG_SZ
    - vdata: "Open Command Prompt here as Administrator"

drive-shell-icon:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Drive\shell\CmdAsAdmin
    - vname: Icon
    - vtype: REG_SZ
    - vdata: cmd.exe

drive-shell-shield:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Drive\shell\CmdAsAdmin
    - vname: HasLUAShield
    - vtype: REG_SZ

drive-shell-command:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Drive\shell\CmdAsAdmin\command
    - vtype: REG_SZ
    - vdata: "cmd /c echo|set/p=\"%L\"|powershell -nop -W 1 -noni -nol \"SaPs 'cmd' -Args '/c \"\"\"cd /d',$([char]34+$Input+[char]34),'^&^& start /b cmd.exe\"\"\"' -Verb RunAs\""

library-background-shell:
  reg.present:
    - name: HKEY_CLASSES_ROOT\LibraryFolder\background\shell\CmdAsAdmin
    - vtype: REG_SZ
    - vdata: "Open Command Prompt here as Administrator"

library-background-shell-icon:
  reg.present:
    - name: HKEY_CLASSES_ROOT\LibraryFolder\background\shell\CmdAsAdmin
    - vname: Icon
    - vtype: REG_SZ
    - vdata: cmd.exe

library-background-shell-shield:
  reg.present:
    - name: HKEY_CLASSES_ROOT\LibraryFolder\background\shell\CmdAsAdmin
    - vname: HasLUAShield
    - vtype: REG_SZ

library-background-shell-command:
  reg.present:
    - name: HKEY_CLASSES_ROOT\LibraryFolder\background\shell\CmdAsAdmin\command
    - vtype: REG_SZ
    - vdata: "cmd /c echo|set/p=\"%L\"|powershell -nop -W 1 -noni -nol \"SaPs 'cmd' -Args '/c \"\"\"cd /d',$([char]34+$Input+[char]34),'^&^& start /b cmd.exe\"\"\"' -Verb RunAs\""

linked-connections:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
    - vname: EnableLinkedConnections
    - vtype: REG_DWORD
    - vdata: 1

