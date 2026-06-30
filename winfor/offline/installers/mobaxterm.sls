# Name: MobaXterm
# Website: https://mobaxterm.mobatek.net
# Description: Enhanced Terminal for Windows
# Category: Terminals
# Author: Mobatek (https://www.mobatek.net/aboutus.html)
# License: https://mobaxterm.mobatek.net/license.html
# Version: 26.3
# Notes: Home Edition

{% set version = '26.3' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'mobaxterm-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\mobaxterm\\' + pkg) %}

{% if exists %}

mobaxterm-extract-offline:
  archive.extracted:
    - name: '{{ downloads }}\mobaxterm\'
    - source: '{{ downloads }}\mobaxterm\{{ pkg }}'
    - enforce_toplevel: False

mobaxterm-install-offline:
  cmd.run:
    - name: "msiexec /i MobaXterm_installer_{{ version }}.msi DESKTOP_SHORTCUT=FALSE /qn /norestart"
    - cwd: '{{ downloads }}\mobaxterm'
    - shell: cmd
    - require:
      - archive: mobaxterm-extract-offline

mobaxterm-del-shortcut-offline:
  file.absent:
    - name: 'C:\Users\Public\Desktop\MobaXterm.lnk'
    - require:
      - cmd: mobaxterm-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
