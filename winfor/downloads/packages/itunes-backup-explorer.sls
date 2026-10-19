# Name: iTunes-Backup-Explorer
# Website: https://github.com/MaxiHuHe04/iTunes-Backup-Explorer
# Description: Java-based tool to explore iTunes backups
# Category: Mobile Analysis
# Author: Maxi Herczegh
# License: MIT License (https://github.com/MaxiHuHe04/iTunes-Backup-Explorer/blob/master/LICENSE | 3RD-PARTY-LICENSES.txt)
# Version: 1.7
# Notes:

{% set version = '1.7' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('itunes-backup-explorer') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

itunes-backup-explorer-download-only:
  file.managed:
    - name: '{{ downloads }}\itunes-backup-explorer\itunes-backup-explorer-{{ version }}.msi'
    - source: https://github.com/MaxiHuHe04/iTunes-Backup-Explorer/releases/download/v{{ version }}/iTunes_Backup_Explorer-{{ version }}_win_x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
