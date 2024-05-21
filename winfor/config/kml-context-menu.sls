{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

generate-kml-context-menu:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\shell\GenerateKML
    - vtype: REG_SZ
    - vdata: "Generate KML"

generate-kml-icon:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\shell\GenerateKML
    - vtype: REG_SZ
    - vname: Icon
    - vdata: PortableDeviceStatus.dll,9

generate-kml-position:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\shell\GenerateKML
    - vtype: REG_SZ
    - vname: Position
    - vdata: Bottom

generate-kml-command:
  reg.present:
    - name: HKEY_CLASSES_ROOT\Directory\shell\GenerateKML\command
    - vtype: REG_SZ
    - vdata: "cmd.exe /c \"echo Generating KML for \"%1\" as \"%w\\KML-OUTPUT.kml\" & {{ inpath | regex_escape }}\\exiftool\\exiftool.exe -ee3 -m -n -r -q -p {{ inpath | regex_escape }}\\exiftool\\kml.fmt \"%1\"\" > KML-OUTPUT.kml"
