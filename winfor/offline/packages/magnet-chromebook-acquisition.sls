# Name: Magnet Chromebook Acquisition
# Website: https://www.magnetforensics.com
# Description: Evidence Acquisition for Chromebook
# Category: Acquisition and Analysis
# Author: Jad Saliba - Magnet Forensics
# License: EULA
# Version: 1.06
# Notes:

{% set version = '1.06' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'magnet-chromebook-acquisition-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\magnetforensics\\' + pkg) %}

{% if exists %}
magnet-chromebook-acquisition-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\magnetforensics\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
