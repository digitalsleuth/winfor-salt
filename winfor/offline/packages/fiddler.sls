# Name: Telerik Fiddler
# Website: https://www.telerik.com
# Description: Web debugging proxy tool
# Category: Network
# Author: Telerik
# License: 
# Version: 5.0.20261.4301
# Notes: 

{% set version = '5.0.20261.4301' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'fiddler-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\fiddler\\' + pkg) %}
{% if grains['cpuarch'] == 'AMD64' %}
    {% set PROGRAM_FILES = "%ProgramFiles(x86)%" %}
{% else %}
    {% set PROGRAM_FILES = "%ProgramFiles%" %}
{% endif %}

{% if exists %}
fiddler-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S /D={{ PROGRAM_FILES }}\Fiddler'
    - shell: cmd
    - cwd: '{{ downloads }}\fiddler\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
