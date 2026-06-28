# Name: Autopsy
# Website: https://www.sleuthkit.org
# Description: GUI based application for image analysis
# Category: Acquisition and Analysis
# Author: Brian Carrier / Basis Technology
# License: Apache 2.0 (https://github.com/sleuthkit/autopsy/blob/master/README.txt)
# Version: 4.22.0
# Notes: 

{% set version = '4.22.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAM_FILES = "%ProgramFiles%" %}
{% set pkg = 'autopsy-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\autopsy\\' + pkg) %}

{% if exists %}
autopsy-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} APPDIR="{{ PROGRAM_FILES}}\Autopsy\" /quiet /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\autopsy'

autopsy-icon-remove-offline:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Autopsy {{ version }}.lnk'
    - require:
      - cmd: autopsy-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
