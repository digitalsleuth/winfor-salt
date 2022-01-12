{% set version = '2.2.1' %}
{% set hash = '7460425d281455ef6f74e7262e09ee2d86ef8b0754cade399044fc67e5561854' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

eventfinder-download:
  file.managed:
    - name: 'C:\standalone\eventfinder\EventFinder.exe'
    - source: https://github.com/BeanBagKing/EventFinder2/releases/download/{{ version }}/EventFinder.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True

eventfinder-env-vars:
  win_path.exists:
    - name: 'C:\standalone\eventfinder\'

winfor-standalones-eventfinder-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\EventFinder.lnk'
    - target: 'C:\standalone\eventfinder\eventfinder.exe'
    - force: True
    - working_dir: 'C:\standalone\eventfinder\'
    - makedirs: True
    - require:
      - file: eventfinder-download

