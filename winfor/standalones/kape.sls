{% set version = '1.1.0.1' %}
{% set hash = '5f47b4a6ea5befb4840c4847d427231372660d18f1d2806498e6c4e78b578263' %}
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set home = salt['user.info'](user).home %}

include:
  - winfor.config.user

kape-download:
  file.managed:
    - name: 'C:\salt\tempdownload\kape.zip'
    - source: https://s3.amazonaws.com/cyb-us-prd-kape/kape.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

kape-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload'
    - source: 'C:\salt\tempdownload\kape.zip'
    - enforce_toplevel: False
    - require:
      - file: kape-download

kape-folder-move:
  file.rename:
    - name: 'C:\standalone\kape'
    - source: 'C:\salt\tempdownload\KAPE\'
    - force: True
    - makedirs: True
    - require:
      - archive: kape-extract

kape-env-vars:
  win_path.exists:
    - name: 'C:\standalone\kape\'

winfor-standalones-gkape-shortcut:
  file.shortcut:
    - name: '{{ home }}\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\gkape.lnk'
    - target: 'C:\standalone\kape\gkape.exe'
    - user: {{ user }}
    - force: True
    - working_dir: 'C:\standalone\kape\'
    - makedirs: True
    - require:
      - file: kape-folder-move
      - user: winfor-user-{{ user }}
