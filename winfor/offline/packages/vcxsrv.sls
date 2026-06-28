# Name: VcXsrv Windows X Server
# Website: https://sourceforge.net/projects/vcxsrv
# Description: Windows X-Server for interacting with X-Windows environments
# Category: Utilities
# Author: Marha
# License: GNU General Public License v3 (https://sourceforge.net/p/vcxsrv/code/ci/master/tree/COPYING)
# Version: 21.1.16.1
# Notes: 

{% set version = '21.1.16.1' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'vcxsrv-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\vcxsrv\\' + pkg) %}

{% if exists %}
vcxsrv-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S'
    - shell: cmd
    - cwd: '{{ downloads }}\vcxsrv\'

vcxsrv-icon-remove-offline:
  file.absent:
    - name: 'C:\Users\Public\Desktop\XLaunch.lnk'
    - require:
      - cmd: vcxsrv-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
