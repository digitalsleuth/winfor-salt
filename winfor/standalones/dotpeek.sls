{% set version = '2021.3.2' %}
{% set hash = 'b50606c2af174072908207ca30530e0c644ea86e5a7cf9a3caa0490b025d07f6' %}
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set home = salt['user.info'](user).home %}

include:
  - winfor.config.user

dotpeek-download:
  file.managed:
    - name: 'C:\standalone\dotpeek\dotPeek64.exe'
    - source: https://download.jetbrains.com/resharper/dotUltimate.{{ version }}/dotPeek64.{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

dotpeek-env-vars:
  win_path.exists:
    - name: 'C:\standalone\dotpeek\'
    - require:
      - file: dotpeek-download

winfor-standalones-dotpeek-shortcut:
  file.shortcut:
    - name: '{{ home }}\Desktop\dotPeek64.lnk'
    - target: 'C:\standalone\dotpeek\dotPeek64.exe'
    - user: forensics
    - force: True
    - working_dir: 'C:\standalone\dotpeek\'
    - makedirs: True
    - require:
      - file: dotpeek-download
      - user: winfor-user-{{ user }}
