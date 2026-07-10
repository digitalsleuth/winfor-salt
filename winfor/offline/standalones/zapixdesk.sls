# Name: ZAPiXDESK
# Website: https://github.com/kraftdenker/ZAPiXDESK
# Description: PowerShell script for acquiring and decrypting WhatsApp Desktop
# Category: Acquisition and Analysis
# Author: Alberto Magno and Corey Forman (digitalsleuth)
# License: GNU General Public License v3.0 (https://github.com/kraftdenker/ZAPiXDESK/blob/main/LICENSE)
# Version: 2.1
# Notes:

{% set version = '2.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'zapixdesk' %}
{% set exists = salt['file.directory_exists'](downloads + '\\zapixdesk') %}

{% if exists %}

zapixdesk-rename-offline:
  file.rename:
    - name: '{{ inpath }}\zapixdesk'
    - source: '{{ downloads }}\zapixdesk'
    - makedirs: True
    - force: True

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
