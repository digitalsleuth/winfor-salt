# Name: iTunes-Backup-Explorer
# Website: https://github.com/MaxiHuHe04/iTunes-Backup-Explorer
# Description: Java-based tool to explore iTunes backups
# Category: Mobile Analysis
# Author: Maxi Herczegh
# License: MIT License (https://github.com/MaxiHuHe04/iTunes-Backup-Explorer/blob/master/LICENSE | 3RD-PARTY-LICENSES.txt)
# Version: 1.7
# Notes:

{% set version = '1.7' %}
{% set hash = '2220e9a64258201eba64f19ae6ad8d1f6bb1c375ff3ad2284cfefc36c2c02e20' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

itunes-backup-explorer-download-only:
  file.managed:
    - name: '{{ downloads }}\itunes-backup-explorer\iTunes_Backup_Explorer-{{ version }}_win_x64.msi'
    - source: https://github.com/MaxiHuHe04/iTunes-Backup-Explorer/releases/download/v{{ version }}/iTunes_Backup_Explorer-{{ version }}_win_x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
