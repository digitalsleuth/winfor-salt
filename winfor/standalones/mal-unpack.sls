mal-unpack-download:
  file.managed:
    - name: 'C:\salt\tempdownload\mal_unpack64.zip'
    - source: https://github.com/hasherezade/mal_unpack/releases/download/0.9/mal_unpack64.zip
    - source_hash: sha256=1e423bf2032030db899266a7cb031a525daeffae1d8102ff678d2f6419843a84
    - makedirs: True

mal-unpack-extract:
  archive.extracted:
    - name: 'C:\standalone\mal-unpack'
    - source: 'C:\salt\tempdownload\mal_unpack64.zip'
    - enforce_toplevel: False
    - require:
      - file: mal-unpack-download

mal-unpack-env-vars:
  win_path.exists:
    - name: 'C:\standalone\mal-unpack\'

