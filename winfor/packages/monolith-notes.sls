# Name: Monolith Notes
# Website: https://www.monolithforensics.com/
# Description: Forensic note taking and tracking tool
# Category: Utilities
# Author: Monolith Forensics
# License: EULA
# Version: 1.0.1
# Notes:

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set PROGRAMFILES = salt['environ.get']('PROGRAMFILES') %}

monolith-notes:
  pkg.installed

monolith-notes-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Monolith Notes.lnk'
    - target: '{{ PROGRAMFILES }}\Monolith Notes\Monolith Notes.exe'
    - force: True
    - working_dir: '{{ PROGRAMFILES }}\Monolith Notes\'
    - makedirs: True
    - require:
      - pkg: monolith-notes
