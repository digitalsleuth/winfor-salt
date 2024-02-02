# Name: Portals
# Website: https://portals-app.com
# Description: Desktop Organizer
# Category: Requirements
# Author: Ross Patterson
# License: Free To Use - Terms and Conditions (https://rosspat.dev/privacy/)
# Version: 3.2.0.3
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.2.0.3' %}
{% set dashes = version | replace(".","-") %}
{% set hash = '03ebbbec6ac82a6a111ef510709d31e028d440a8c434ae0c6735b01bfab127da' %}

portals-download-only:
  file.managed:
    - name: '{{ downloads }}\portals\portals_installer_v{{ dashes }}.exe'
    - source: https://downloads.portals-app.com/installers/{{ version }}/portals_installer_v{{ dashes }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
