{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set home = salt['user.info'](user).home %}

include:
  - winfor.config.user

logviewer2-download:
  file.managed:
    - name: 'C:\salt\tempdownload\LogViewer2.v1.0.0.zip'
    - source: https://github.com/woanware/LogViewer2/releases/download/v1.0.0/LogViewer2.v1.0.0.zip
    - source_hash: sha256=71aad9479657e5673f56b21b58977e151fa1ed4d82d55164e25e6aeaaeea4fa2
    - makedirs: True

logviewer2-extracted:
  archive.extracted:
    - name: 'C:\standalone\logviewer2'
    - source: 'C:\salt\tempdownload\LogViewer2.v1.0.0.zip'
    - enforce_toplevel: False
    - require:
      - file: logviewer2-download

logviewer2-env-vars:
  win_path.exists:
    - name: 'C:\standalone\logviewer2\'

logviewer2-shortcut:
  file.shortcut:
    - name: '{{ home }}\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\LogViewer2.lnk'
    - target: 'C:\standalone\logviewer2\LogViewer2.exe'
    - user: {{ user }}
    - force: True
    - working_dir: 'C:\standalone\logviewer2\'
    - makedirs: True
    - require:
      - file: logviewer2-download
      - archive: logviewer2-extracted
      - user: winfor-user-{{ user }}
