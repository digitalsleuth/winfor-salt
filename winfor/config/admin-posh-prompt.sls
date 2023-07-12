{% set paths = ["HKEY_CLASSES_ROOT\Directory\shell\Windows.PowershellAsAdmin","HKEY_CLASSES_ROOT\Directory\Background\shell\Windows.PowershellAsAdmin","HKEY_CLASSES_ROOT\Drive\shell\Windows.PowershellAsAdmin","HKEY_CLASSES_ROOT\LibraryFolder\Background\shell\Windows.PowershellAsAdmin"] %}

{% for path in paths %}
canonical-name-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vname: CanonicalName
    - vtype: REG_SZ
    - vdata: '{ADB73FFC-1568-4D7D-BCD5-6D11A417AF64}'

command-state-sync-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vname: CommandStateSync
    - vtype: REG_SZ

description-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vname: Description
    - vtype: REG_SZ
    - vdata: '@shell32.dll,-37499'

explorer-command-handler-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vname: ExplorerCommandHandler
    - vtype: REG_SZ
    - vdata: '{BF0AC53F-D51C-419F-92E3-2298E125F004}'

icon-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vname: Icon
    - vtype: REG_SZ
    - vdata: imageres.dll,-5373

implied-selection-model-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vname: ImpliedSelectionModel
    - vtype: REG_DWORD
    - vdata: 1

muiverb-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vname: MUIVerb
    - vtype: REG_SZ
    - vdata: '@shell32.dll,-37448'

resolve-links-invoke-behavior-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vname: ResolveLinksInvokeBehavior
    - vtype: REG_DWORD
    - vdata: 3

resolve-links-query-behavior-{{ path }}:
  reg.present:
    - name: {{ path }}
    - vname: ResolveLinksQueryBehavior
    - vtype: REG_DWORD
    - vdata: 0

{% endfor %}

linked-connections-posh:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
    - vname: EnableLinkedConnections
    - vtype: REG_DWORD
    - vdata: 1
