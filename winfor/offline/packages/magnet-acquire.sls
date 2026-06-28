# Name: Magnet Acquire
# Website: https://www.magnetforensics.com
# Description: Evidence Acquisition tool
# Category: Acquisition and Analysis
# Author: Jad Saliba - Magnet Forensics
# License: EULA
# Version: 2.95.0.43864
# Notes:

{% set version = '2.95.0.43864' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'magnet-acquire-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\magnetforensics\\' + pkg) %}

{% if exists %}
magnet-acquire-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\magnetforensics\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
