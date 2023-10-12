# Name: Portals
# Website: https://portals-app.com
# Description: Desktop Organizer
# Category: Requirements
# Author: Ross Patterson
# License: Free To Use - Terms and Conditions (https://rosspat.dev/privacy/)
# Version: 3.0.2.2
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.0.2.2' %}
{% set dashes = version | replace(".","-") %}
{% set hash = '931b210cfd3f5f39e3fccd687f8b49be8bd8fb92f34fd3465307e9a4f998ddca' %}

portals-download-only:
  file.managed:
    - name: '{{ downloads }}\portals\portals_installer_v{{ dashes }}.exe'
    - source: https://downloads.portals-app.com/installers/{{ version }}/portals_installer_v{{ dashes }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
