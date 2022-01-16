silketw-download:
  file.managed:
    - name: 'C:\salt\tempdownload\SilkETW_SilkService_v8.zip'
    - source: https://github.com/mandiant/SilkETW/releases/download/v0.8/SilkETW_SilkService_v8.zip
    - source_hash: sha256=6c612c406844c72cde51bcd0660ca6bb704656549043cb5a8b8bbba5fe3d8dc3
    - makedirs: True

silketw-extract:
  archive.extracted:
    - name: 'C:\standalone\silketw'
    - source: 'C:\salt\tempdownload\SilkETW_SilkService_v8.zip'
    - enforce_toplevel: False
    - require:
      - file: silketw-download

silketw-env-vars:
  win_path.exists:
    - names:
      - 'C:\standalone\silketw\v8\SilkETW\'
      - 'C:\standalone\silketw\v8\SilkService\'
