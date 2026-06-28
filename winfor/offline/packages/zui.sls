# Name: Zui
# Website: https://www.brimdata.io/
# Description: Network Forensic GUI Tool using Zeek, Suricata and Zed
# Category: Network
# Author: Brim Data
# License: GNU General Public License (GPL) (https://github.com/brimdata/zui/blob/main/apps/zui/LICENSE.txt)
# Version: 1.18.0
# Notes:

{% set version = '1.18.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'zui-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\zui\\' + pkg) %}
{% set PROGRAM_FILES = "%ProgramFiles%" %}

{% if exists %}
zui-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S /allusers /no-desktop-shortcut /D="{{ PROGRAM_FILES }}\Zui\"'
    - shell: cmd
    - cwd: '{{ downloads }}\zui\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
