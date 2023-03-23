# Name: EventFinder
# Website: https://github.com/BeanBagKing/EventFinder2
# Description: Event Log Parser
# Category: Logs
# Author: BeanBagKing
# License: GNU General Public License v3 (https://github.com/BeanBagKing/EventFinder2/blob/master/LICENSE)
# Version: 2.2.1
# Notes: 

{% set version = '2.2.1' %}
{% set hash = '7460425d281455ef6f74e7262e09ee2d86ef8b0754cade399044fc67e5561854' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

eventfinder-download-only:
  file.managed:
    - name: '{{ downloads }}\EventFinder.exe'
    - source: https://github.com/BeanBagKing/EventFinder2/releases/download/{{ version }}/EventFinder.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
