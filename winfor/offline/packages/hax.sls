# Name: H@x
# Website: https://thefreetoolproject.eu
# Description: Hex Editor for Investigators
# Category: Raw Parsers / Decoders
# Author: https://thefreetoolproject.eu/#DOWNLOADS
# License: GNU General Public License v3
# Version: 1.1.6
# Notes: 

{% set version = '1.1.6' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'hax-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\hax\\' + pkg) %}

{% if exists %}
hax-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S /VERYSILENT /NORESTART /ALLUSERS'
    - shell: cmd
    - cwd: '{{ downloads }}\hax\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
