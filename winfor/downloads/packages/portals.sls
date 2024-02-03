# Name: Portals
# Website: https://portals-app.com
# Description: Desktop Organizer
# Category: Requirements
# Author: Ross Patterson
# License: Free To Use - Terms and Conditions (https://rosspat.dev/privacy/)
# Version: 3.2.1.0
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.2.1.0' %}
{% set dashes = version | replace(".","-") %}
{% set hash = 'd8544349bbb228cd6db18b86bd294fdc667b67607f60b81e780422939e244ee4' %}

portals-download-only:
  file.managed:
    - name: '{{ downloads }}\portals\portals_installer_v{{ dashes }}.exe'
    - source: https://downloads.portals-app.com/installers/{{ version }}/portals_installer_v{{ dashes }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
