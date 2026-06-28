# Name: MSG Viewer
# Website: https://www.pstwalker.com/
# Description: Forensic GUI Tool for MSG, EML
# Category: Email
# Author: PST Walker
# License: GNU General Public License (GPL) (https://www.pstwalker.com/licensing-policy.html)
# Version: 4.35
# Notes:

{% set version = '435' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'msg-viewer-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\msg-viewer\\' + pkg) %}

{% if exists %}
msg-viewer-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\msg-viewer\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
