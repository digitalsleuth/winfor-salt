# Name: Forensic Email Collector
# Website: https://metaspike.com
# Description: Local and Remote email acquisition tool
# Category: Email
# Author: Arman Gungor - Metaspike
# License:
# Version: 4.5.848.87
# Notes:

{% set version = '4.5.848.87' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'fec-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\fec\\' + pkg) %}

{% if exists %}
fec-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /qn ACCEPTEULA=1 /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\fec\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
