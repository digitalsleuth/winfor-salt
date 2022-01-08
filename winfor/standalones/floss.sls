{% set version = '1.7.0' %}
{% set hash = '9b433a949b210bb8a856de2546cb075c349e0c2582ee9bf6b5fe51d9f95e7690' %}

floss-download:
  file.managed:
    - name: 'C:\salt\tempdownload\floss-v{{ version }}-windows.zip'
    - source: https://github.com/mandiant/flare-floss/releases/download/v{{ version }}/floss-v{{ version }}-windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

floss-extract:
  archive.extracted:
    - name: 'C:\standalone\floss'
    - source: 'C:\salt\tempdownload\floss-v{{ version }}-windows.zip'
    - enforce_toplevel: False
    - require:
      - file: floss-download

floss-env-vars:
  win_path.exists:
    - name: 'C:\standalone\floss\'
