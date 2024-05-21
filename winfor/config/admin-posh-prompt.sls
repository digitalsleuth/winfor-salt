{% set paths = ["HKEY_CLASSES_ROOT\Directory\shell\Windows.PowershellAsAdmin",
                "HKEY_CLASSES_ROOT\Directory\Background\shell\Windows.PowershellAsAdmin",
                "HKEY_CLASSES_ROOT\Drive\shell\Windows.PowershellAsAdmin",
               ] %}

{% for path in paths %}

powershell-admin-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vtype: REG_SZ
    - vdata: "Open PowerShell here as Administrator"

powershell-admin-icon-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vname: Icon
    - vtype: REG_SZ
    - vdata: imageres.dll,-5372

powershell-admin-position-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vname: Position
    - vtype: REG_SZ
    - vdata: Bottom

powershell-admin-lua-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vname: HasLUAShield
    - vtype: REG_SZ

powershell-admin-command-{{ path }}:
  reg.present:
    - name: {{ path }}\command
    - vtype: REG_SZ
    - vdata: "powershell Start-Process PowerShell -verb runas -ArgumentList '-noexit', 'Push-Location -literalPath ''\"\"\"\"%V\"\"\"\"'''"

{% endfor %}
