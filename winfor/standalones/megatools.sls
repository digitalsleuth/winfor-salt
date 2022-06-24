{% set version = '1.11.0' %}
{% set date = '20220519' %}
{% set hash = '3588d85606fec96c7477eafaf154695161025e29fa6bdcfdf827a14b3f1d4501' %}

megatools-download:
  file.managed:
    - name: 'C:\salt\tempdownload\megatools-{{ version }}.{{ date }}-win64.zip'
    - source: 'https://megatools.megous.com/builds/builds/megatools-{{ version }}.{{ date }}-win64.zip'
    - source_hash: sha256={{ hash }}
    - makedirs: True

megatools-extract:
  archive.extracted:
    - name: 'C:\standalone\'
    - source: 'C:\salt\tempdownload\megatools-{{ version }}.{{ date }}-win64.zip'
    - enforce_toplevel: True
    - require:
      - file: megatools-download

megatools-folder-rename:
  file.rename:
    - name: 'C:\standalone\megatools'
    - source: 'C:\standalone\megatools-{{ version }}.{{ date }}-win64\'
    - force: True
    - makedirs: True
    - require:
      - archive: megatools-extract

megatools-env-vars:
  win_path.exists:
    - name: 'C:\standalone\megatools\'
    - require:
      - file: megatools-download
      - archive: megatools-extract
