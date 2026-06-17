# Name: FastCopy
# Website: https://fastcopy.jp
# Description: Fast file copy software which can retain file details
# Category: Utilities
# Author: FastCopy Lab - https://fastcopy.jp/company.html
# License: Copyright - All rights reserved - https://fastcopy.jp/help/fastcopy_eng.htm#license
# Version: 5.11.2
# Notes:

{% set version = '5.11.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

fastcopy-install-offline:
  cmd.run:
    - name: '{{ downloads }}\fastcopy\FastCopy{{ version }}_installer.exe /SILENT /DIR={{ inpath }}\fastcopy /NODESK /NOPROG'
    - shell: cmd

fastcopy-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\FastCopy.lnk'
    - target: '{{ inpath }}\fastcopy\FastCopy.exe'
    - force: True
    - working_dir: '{{ inpath }}\fastcopy\'
    - makedirs: True
    - require:
      - cmd: fastcopy-install-offline
