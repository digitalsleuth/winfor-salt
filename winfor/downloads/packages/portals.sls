# Name: Portals
# Website: https://portals-app.com
# Description: Desktop Organizer
# Category: Requirements
# Author: Ross Patterson
# License: Free To Use - Terms and Conditions (https://rosspat.dev/privacy/)
# Version: 2.1.0.6
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.1.0.6' %}
{% set dashes = version | replace(".","-") %}
{% set hash = '02afdbdd77bf4b09cc905854fa4642e20d3d7c91bd6c7b855bd3a849cc6a8224' %}

portals-download-only:
  file.managed:
    - name: '{{ downloads }}\portals_installer_v{{ dashes }}.exe'
    - source: https://downloads.portals-app.com/installers/{{ version }}/portals_installer_v{{ dashes }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
