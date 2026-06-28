# Name: iTunes-Backup-Explorer
# Website: https://github.com/MaxiHuHe04/iTunes-Backup-Explorer
# Description: Java-based tool to explore iTunes backups
# Category: Mobile Analysis
# Author: Maxi Herczegh
# License: MIT License (https://github.com/MaxiHuHe04/iTunes-Backup-Explorer/blob/master/LICENSE | 3RD-PARTY-LICENSES.txt)
# Version: 1.7
# Notes: MSI install comes with everything required in 1.7+

{% set version = '1.7' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'itunes-backup-explorer-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\itunes-backup-explorer\\' + pkg) %}

{% if exists %}
itunes-backup-explorer-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /qn /norestart ALLUSERS=1 INSTALLDIR="C:\Program Files\iTunes Backup Explorer"'
    - shell: cmd
    - cwd: '{{ downloads }}\itunes-backup-explorer\'

itunes-backup-explorer-del-shortcut-offline:
  file.absent:
    - name: 'C:\Users\Public\Desktop\iTunes Backup Explorer.lnk'
    - require:
      - cmd: itunes-backup-explorer-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
