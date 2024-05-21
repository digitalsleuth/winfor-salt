{% set paths = ["HKEY_CLASSES_ROOT\Directory\shell\Windows.CmdAsAdmin",
                "HKEY_CLASSES_ROOT\Drive\shell\Windows.CmdAsAdmin",
               ] %}

{% for path in paths %}

cmd-admin-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vtype: REG_SZ
    - vdata: "Open Command Prompt here as Administrator"

cmd-admin-icon-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vname: Icon
    - vtype: REG_SZ
    - vdata: imageres.dll,-5323

cmd-admin-position-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vname: Position
    - vtype: REG_SZ
    - vdata: Bottom

cmd-admin-LUA-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vname: HasLUAShield
    - vtype: REG_SZ

cmd-admin-command-{{ path }}:
  reg.present:
    - name: {{ path }}\command
    - vtype: REG_SZ
    - vdata: "cmd /c echo|set/p=\"%L\"|powershell -nop -W 1 -noni -nol \"SaPs 'cmd' -Args '/c \"\"\"cd /d',$([char]34+$Input+[char]34),'^&^& start /b cmd.exe\"\"\"' -Verb RunAs\""

{% endfor %}

cmd-admin-background:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\Background\shell\Windows.CmdAsAdmin
    - vtype: REG_SZ
    - vdata: "Open Command Prompt here as Administrator"

cmd-admin-background-icon:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\Background\shell\Windows.CmdAsAdmin
    - vtype: REG_SZ
    - vname: Icon
    - vdata: imageres.dll,-5323

cmd-admin-background-position:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\Background\shell\Windows.CmdAsAdmin
    - vtype: REG_SZ
    - vname: Position
    - vdata: Bottom

cmd-admin-background-LUA:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\Background\shell\Windows.CmdAsAdmin
    - vtype: REG_SZ
    - vname: HasLUAShield

cmd-admin-background-command:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\Background\shell\Windows.CmdAsAdmin\command
    - vtype: REG_SZ
    - vdata: "cmd /c echo|set/p=\"%V\"|powershell -nop -W 1 -noni -nol \"SaPs 'cmd' -Args '/c \"\"\"cd /d',$([char]34+$Input+[char]34),'^&^& start /b cmd.exe\"\"\"' -Verb RunAs\""

