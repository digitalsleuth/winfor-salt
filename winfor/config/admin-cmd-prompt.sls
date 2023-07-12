directory-shell-admin:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\shell\Windows.CmdAsAdmin
    - vtype: REG_SZ
    - vdata: "Open Command Prompt here as Administrator"

directory-shell-admin-icon:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\shell\Windows.CmdAsAdmin
    - vname: Icon
    - vtype: REG_SZ
    - vdata: imageres.dll,-5324

directory-shell-admin-command:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\shell\Windows.CmdAsAdmin\command
    - vtype: REG_SZ
    - vdata: "cmd /c echo|set/p=\"%L\"|powershell -nop -W 1 -noni -nol \"SaPs 'cmd' -Args '/c \"\"\"cd /d',$([char]34+$Input+[char]34),'^&^& start /b cmd.exe\"\"\"' -Verb RunAs\""

directory-background-shell:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\Background\shell\Windows.CmdAsAdmin
    - vtype: REG_SZ
    - vdata: "Open Command Prompt here as Administrator"

directory-background-shell-icon:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\Background\shell\Windows.CmdAsAdmin
    - vname: Icon
    - vtype: REG_SZ
    - vdata: imageres.dll,-5324

directory-background-shell-command:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\Background\shell\Windows.CmdAsAdmin\command
    - vtype: REG_SZ
    - vdata: "cmd /c echo|set/p=\"%V\"|powershell -nop -W 1 -noni -nol \"SaPs 'cmd' -Args '/c \"\"\"cd /d',$([char]34+$Input+[char]34),'^&^& start /b cmd.exe\"\"\"' -Verb RunAs\""

drive-shell-admin:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Drive\shell\Windows.CmdAsAdmin
    - vtype: REG_SZ
    - vdata: "Open Command Prompt here as Administrator"

drive-shell-icon:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Drive\shell\Windows.CmdAsAdmin
    - vname: Icon
    - vtype: REG_SZ
    - vdata: imageres.dll,-5324

drive-shell-command:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Drive\shell\Windows.CmdAsAdmin\command
    - vtype: REG_SZ
    - vdata: "cmd /c echo|set/p=\"%L\"|powershell -nop -W 1 -noni -nol \"SaPs 'cmd' -Args '/c \"\"\"cd /d',$([char]34+$Input+[char]34),'^&^& start /b cmd.exe\"\"\"' -Verb RunAs\""

library-background-shell:
  reg.present:
    - name: HKEY_CLASSES_ROOT\LibraryFolder\background\shell\Windows.CmdAsAdmin
    - vtype: REG_SZ
    - vdata: "Open Command Prompt here as Administrator"

library-background-shell-icon:
  reg.present:
    - name: HKEY_CLASSES_ROOT\LibraryFolder\background\shell\Windows.CmdAsAdmin
    - vname: Icon
    - vtype: REG_SZ
    - vdata: imageres.dll,-5324

library-background-shell-command:
  reg.present:
    - name: HKEY_CLASSES_ROOT\LibraryFolder\background\shell\Windows.CmdAsAdmin\command
    - vtype: REG_SZ
    - vdata: "cmd /c echo|set/p=\"%L\"|powershell -nop -W 1 -noni -nol \"SaPs 'cmd' -Args '/c \"\"\"cd /d',$([char]34+$Input+[char]34),'^&^& start /b cmd.exe\"\"\"' -Verb RunAs\""

linked-connections-cmd:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
    - vname: EnableLinkedConnections
    - vtype: REG_DWORD
    - vdata: 1

