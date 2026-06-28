# Name: File Insight
# Website: https://www.trellix.com
# Description: Static file analysis tool
# Category: Executables
# Author: McAfee / Trellix
# License: Software Royalty-Free License (https://www.trellix.com/en-us/downloads/free-tools/terms-of-use.html)
# Version: 3.0
# Notes: 

{% set version = '3.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'fileinsight-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\fileinsight\\' + pkg) %}

{% if exists %}
fileinsight-install-offline:
  cmd.run:
    - name: '{{ pkg }} /qn /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\fileinsight\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
