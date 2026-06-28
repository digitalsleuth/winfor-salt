# Name: WinSCP
# Website: https://winscp.net/
# Description: Windows SFTP and SCP Client
# Category: Network
# Author: Martin Prikryl
# License: GNU General Public License v3 (https://github.com/winscp/winscp/blob/master/license.txt)
# Version: 6.5.6
# Notes:

{% set version = '6.5.6' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'winscp-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\winscp\\' + pkg) %}

{% if exists %}
winscp-install-offline:
  cmd.run:
    - name: '{{ pkg }} /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\winscp\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
