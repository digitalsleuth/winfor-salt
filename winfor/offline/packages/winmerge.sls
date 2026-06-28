# Name: WinMerge
# Website: https://winmerge.org
# Description: File Differencing Tool
# Category: Utilities
# Author: Dean P. Grimm (Thingamahoocie Software)
# License: GNU General Public License v2.0 (https://github.com/WinMerge/winmerge/blob/master/LICENSE.md)
# Version: 2.16.56.2
# Notes:

{% set version = '2.16.56.2' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'winmerge-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\winmerge\\' + pkg) %}

{% if exists %}
winmerge-install-offline:
  cmd.run:
    - name: '{{ pkg }} /SP- /VERYSILENT /NORESTART /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\winmerge\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
