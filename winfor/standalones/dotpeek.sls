{% set version = '2021.3.2' %}
{% set hash = 'b50606c2af174072908207ca30530e0c644ea86e5a7cf9a3caa0490b025d07f6' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

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
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\dotPeek64.lnk'
    - target: 'C:\standalone\dotpeek\dotPeek64.exe'
    - force: True
    - working_dir: 'C:\standalone\dotpeek\'
    - makedirs: True
    - require:
      - file: dotpeek-download
