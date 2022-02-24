{% set version = '1.11.0' %}
{% set date = '20211030' %}
{% set hash = '55cf04a8b278f1613c44c7bfda2e4ff802dd7ad570108bf8a7510da6141e28ff' %}

megatools-download:
  file.managed:
    - name: 'C:\salt\tempdownload\megatools-{{ version }}-git-{{ date }}-win64.zip'
    - source: 'https://megatools.megous.com/builds/experimental/megatools-{{ version }}-git-{{ date }}-win64.zip'
    - source_hash: sha256={{ hash }}
    - makedirs: True

megatools-extract:
  archive.extracted:
    - name: 'C:\standalone\'
    - source: 'C:\salt\tempdownload\megatools-{{ version }}-git-{{ date }}-win64.zip'
    - enforce_toplevel: True
    - require:
      - file: megatools-download

megatools-folder-rename:
  file.rename:
    - name: 'C:\standalone\megatools'
    - source: 'C:\standalone\megatools-{{ version }}-git-{{ date }}-win64\'
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
