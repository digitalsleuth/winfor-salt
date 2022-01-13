setdll-download:
  file.managed:
    - name: 'C:\salt\tempdownload\setdllcharacteristics_v0_0_0_1.zip'
    - source: http://didierstevens.com/files/software/setdllcharacteristics_v0_0_0_1.zip
    - source_hash: sha256=5A9D3815F317C7C0FF7737F271CE0C60BE2CB0F4168C5EA5AD8CEF84AD718577
    - makedirs: True

setdll-extract:
  archive.extracted:
    - name: 'C:\standalone\setdll'
    - source: 'C:\salt\tempdownload\setdllcharacteristics_v0_0_0_1.zip'
    - enforce_toplevel: False
    - require:
      - file: setdll-download

setdll-env-vars:
  win_path.exists:
    - name: 'C:\standalone\setdll\'
