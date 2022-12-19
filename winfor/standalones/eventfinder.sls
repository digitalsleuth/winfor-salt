# Name: EventFinder
# Website: https://github.com/BeanBagKing/EventFinder2
# Description: Event Log Parser
# Category: Logs
# Author: BeanBagKing
# License: GNU General Public License v3 (https://github.com/BeanBagKing/EventFinder2/blob/master/LICENSE)
# Version: 2.2.1
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2.2.1' %}
{% set hash = '7460425d281455ef6f74e7262e09ee2d86ef8b0754cade399044fc67e5561854' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

eventfinder-download:
  file.managed:
    - name: '{{ inpath }}\eventfinder\EventFinder.exe'
    - source: https://github.com/BeanBagKing/EventFinder2/releases/download/{{ version }}/EventFinder.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True

eventfinder-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\eventfinder\'

winfor-standalones-eventfinder-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\EventFinder.lnk'
    - target: '{{ inpath }}\eventfinder\eventfinder.exe'
    - force: True
    - working_dir: '{{ inpath }}\eventfinder\'
    - makedirs: True
    - require:
      - file: eventfinder-download

