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
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

eventfinder-manage-offline:
  file.managed:
    - name: '{{ inpath }}\eventfinder\Eventfinder.exe'
    - source: '{{ downloads }}\eventfinder\Eventfinder-{{ version }}.exe'
    - skip_verify: True
    - makedirs: True
    - replace: True

eventfinder-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\eventfinder\eventfinder.exe -OutPath {{ inpath }}\shims\eventfinder.exe'
    - require:
      - sls: winfor.config.shims

eventfinder-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\EventFinder.lnk'
    - target: '{{ inpath }}\eventfinder\eventfinder.exe'
    - force: True
    - working_dir: '{{ inpath }}\eventfinder\'
    - makedirs: True
    - require:
      - file: eventfinder-manage-offline
