# Name: PuTTY
# Website: https://www.chiark.greenend.org.uk/~sgtatham/putty/
# Description: Free SSH and Telnet Client
# Category: Network
# Author: Simon Tatham
# License: https://tartarus.org/~simon/putty-snapshots/htmldoc/AppendixD.html#licence
# Version: 0.83
# Notes: 

{% set version = '0.83' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'putty-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\putty\\' + pkg) %}

{% if exists %}
putty-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /qn'
    - shell: cmd
    - cwd: '{{ downloads }}\putty\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
