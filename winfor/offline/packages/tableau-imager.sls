# Name: Tableau Imager
# Website: https://opentext.com
# Description: Disk / Device Imager
# Category: Acquisition and Analysis
# Author: OpenText
# License: EULA
# Version: 20.3.3
# Notes:

{% set version = '20.3' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'tableau-imager-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\tableau\\' + pkg) %}

{% if exists %}
tableau-imager-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /qn /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\tableau\'

tableau-imager-icon-remove-offline:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Tableau Imager.lnk'
    - require:
      - cmd: tableau-imager-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
