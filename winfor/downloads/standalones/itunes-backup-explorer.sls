# Name: iTunes-Backup-Explorer
# Website: https://github.com/MaxiHuHe04/iTunes-Backup-Explorer
# Description: Java-based tool to explore iTunes backups
# Category: Mobile Analysis
# Author: Maxi Herczegh
# License: MIT License (https://github.com/MaxiHuHe04/iTunes-Backup-Explorer/blob/master/LICENSE | 3RD-PARTY-LICENSES.txt)
# Version: 1.4
# Notes: Requires Java 11+

{% set version = '1.4' %}
{% set hash = 'c47ae074a9ffe82d31907e113ef2052ebe250c8281b984b9d7d57c39a457e35a' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

itunes-backup-explorer-download-only:
  file.managed:
    - name: '{{ downloads }}\itunes-backup-explorer\itunes-backup-explorer-{{ version }}.jar'
    - source: https://github.com/MaxiHuHe04/iTunes-Backup-Explorer/releases/download/v{{ version }}/itunes-backup-explorer-{{ version }}.jar
    - source_hash: sha256={{ hash }}
    - makedirs: True
