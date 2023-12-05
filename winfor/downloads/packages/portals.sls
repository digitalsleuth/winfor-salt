# Name: Portals
# Website: https://portals-app.com
# Description: Desktop Organizer
# Category: Requirements
# Author: Ross Patterson
# License: Free To Use - Terms and Conditions (https://rosspat.dev/privacy/)
# Version: 3.1.0.2
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.1.0.2' %}
{% set dashes = version | replace(".","-") %}
{% set hash = 'a6fee7e94c0bbacae1b526bafd30b40765991d9f520fedc26a2cb6ea023be2d2' %}

portals-download-only:
  file.managed:
    - name: '{{ downloads }}\portals\portals_installer_v{{ dashes }}.exe'
    - source: https://downloads.portals-app.com/installers/{{ version }}/portals_installer_v{{ dashes }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
