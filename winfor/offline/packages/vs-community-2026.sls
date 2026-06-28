# Name: Visual Studio Community Edition 2026
# Website: https://visualstudio.microsoft.com
# Description: Windows IDE for developing in multiple Windows-based programming languages
# Category: Requirements
# Author: Microsoft
# License: https://aka.ms/VSLicensingPaper
# Version: 18.7.11919.86
# Notes: Installation and application are 18.x, but environment is 2026

{% set version = '18.7.11919.86' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'vs-community-2026-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\vs-community\\' + pkg) %}

{% if exists %}
visual-studio-community-2026-install-offline:
  cmd.run:
    - name: '{{ pkg }} --quiet --norestart --wait'
    - shell: cmd
    - cwd: '{{ downloads }}\vs-community\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
