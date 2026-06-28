# Name: FEX Imager
# Website: https://getdataforensics.com
# Description: Physical and Logical Imaging Tool
# Category: Acquisition and Analysis
# Author: GetData Forensics
# License: Free
# Version: 2.2.1.306
# Notes: 

{% set version = '2.2.1.306' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'fex-imager-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\fex-imager\\' + pkg) %}

{% if exists %}
fex-imager-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\fex-imager\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
