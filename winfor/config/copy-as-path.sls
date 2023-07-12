{% set path = 'HKEY_CLASSES_ROOT\AllFileSystemObjects\shell\Windows.copyaspath' %}

copy-as-path-canonical-name:
  reg.present:
    - name: {{ path }}
    - vname: CanonicalName
    - vtype: REG_SZ
    - vdata: '{707C7BC6-685A-4A4D-A275-3966A5A3EFAA}'

copy-as-path-command-state-handler:
  reg.present:
    - name: {{ path }}
    - vname: CommandStateHandler
    - vtype: REG_SZ
    - vdata: '{3B1599F9-E00A-4BBF-AD3E-B3F99FA87779}'

copy-as-path-command-state-sync:
  reg.present:
    - name: {{ path }}
    - vname: CommandStateSync
    - vtype: REG_SZ

copy-as-path-description:
  reg.present:
    - name: {{ path }}
    - vname: Description
    - vtype: REG_SZ
    - vdata: '@shell32.dll,-30336'

copy-as-path-icon:
  reg.present:
    - name: {{ path }}
    - vname: Icon
    - vtype: REG_SZ
    - vdata: imageres.dll,-5302

copy-as-path-invoke-command:
  reg.present:
    - name: {{ path }}
    - vname: InvokeCommandOnSelection
    - vtype: REG_DWORD
    - vdata: 1

copy-as-path-muiverb:
  reg.present:
    - name: {{ path }}
    - vname: MUIVerb
    - vtype: REG_SZ
    - vdata: '@shell32.dll,-30329'

copy-as-path-verbhandler:
  reg.present:
    - name: {{ path }}
    - vname: VerbHandler
    - vtype: REG_SZ
    - vdata: '{f3d06e7c-1e45-4a26-847e-f9fcdee59be0}'

copy-as-path-verbname:
  reg.present:
    - name: {{ path }}
    - vname: VerbName
    - vtype: REG_SZ
    - vdata: copyaspath
