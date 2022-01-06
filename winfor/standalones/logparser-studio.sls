{% set hash = 'cf4e8fb1970230c0cb699324246d14b5406e284e566a1e06717d1b785b77c893' %}
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set home = salt['user.info'](user).home %}

include:
  - winfor.packages.logparser
  - winfor.config.user

logparser-studio-download:
  file.managed:
    - name: 'C:\salt\tempdownload\LPSV2.D2.zip'
    - source: https://techcommunity.microsoft.com/gxcuf89792/attachments/gxcuf89792/Exchange/16744/1/LPSV2.D2.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.packages.logparser

logparser-studio-extract:
  archive.extracted:
    - name: 'C:\standalone\'
    - source: 'C:\salt\tempdownload\LPSV2.D2.zip'
    - enforce_toplevel: False
    - require:
      - file: logparser-studio-download

logparser-studio-rename:
  file.rename:
    - name: 'C:\standalone\logparser-studio'
    - source: 'C:\standalone\LPSV2.D1'
    - force: True
    - makedirs: True
    - require:
      - archive: logparser-studio-extract

logparser-studio-env-vars:
  win_path.exists:
    - name: 'C:\standalone\logparser-studio'

winfor-standalones-logparser-studio-shortcut:
  file.shortcut:
    - name: '{{ home }}\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\LogParser-Studio.lnk'
    - target: 'C:\standalone\logparser-studio\LPS.exe'
    - user: forensics
    - force: True
    - working_dir: 'C:\standalone\logparser-studio'
    - makedirs: True
    - require:
      - file: logparser-studio-rename
      - user: winfor-user-{{ user }}
