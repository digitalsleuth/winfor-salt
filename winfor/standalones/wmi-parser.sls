wmi-parser-download:
  file.managed:
    - name: 'C:\salt\tempdownload\wmi-parser.v0.0.2.zip'
    - source: https://github.com/woanware/wmi-parser/releases/download/v0.0.2/wmi-parser.v0.0.2.zip
    - source_hash: sha256=55048cccae7adb1471cb0d32a317df306355a37bb5373406a4bf1eeee852671d
    - makedirs: True

wmi-parser-extract:
  archive.extracted:
    - name: 'C:\standalone\wmi-parser'
    - source: 'C:\salt\tempdownload\wmi-parser.v0.0.2.zip'
    - enforce_toplevel: False
    - require:
      - file: wmi-parser-download

wmi-parser-env-vars:
  win_path.exists:
    - name: 'C:\standalone\wmi-parser'
