# Name: Cyotek WebCopy
# Website: https://www.cyotek.com/cyotek-webcopy
# Description: Website Copier
# Category: Network
# Author: Cyotek Ltd
# License: End User License Agreement (https://docs.cyotek.com/cyowcopy/current/licenseagreement.html)
# Version: 1.9.1.872
# Notes: Automatically launches after install. Unfortunately this cannot be avoided.

{% set version = '1.9.1.872' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'webcopy-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\webcopy\\' + pkg) %}

{% if exists %}
webcopy-install-offline:
  cmd.run:
    - name: '{{ pkg }} /SP- /ALLUSERS /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\webcopy\'

webcopy-close-application-offline:
  cmd.run:
    - name: 'taskkill /F /IM "cyowcopy.exe"'
    - bg: True
    - require:
      - cmd: webcopy-install-offline
    - watch:
      - cmd: webcopy-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
