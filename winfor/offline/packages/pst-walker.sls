# Name: PST Walker
# Website: https://www.pstwalker.com/
# Description: Forensic GUI Tool for PST, OST
# Category: Email
# Author: PST Walker
# License: GNU General Public License (GPL) (https://www.pstwalker.com/licensing-policy.html)
# Version: 7.31
# Notes:

{% set version = '7.31' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'pst-walker-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\pst-walker\\' + pkg) %}

{% if exists %}
pst-walker-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\pst-walker\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
