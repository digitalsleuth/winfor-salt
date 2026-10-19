# Name: HTTrack (for Windows)
# Website: https://www.httrack.com
# Description: Website Copier
# Category: Network
# Author: Xavier Roche and other contributors
# License: GNU General Public License v3 (https://www.httrack.com/page/5/en/index.html)
# Version: 3.49.2
# Notes: WinHTTrack is the Windows release of HTTrack

{% set version = '3.49.2' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('httrack') %}

winhttrack-download-only:
  file.managed:
    - name: '{{ downloads }}\httrack\httrack-{{ version }}.exe'
    - source: https://mirror.httrack.com/httrack_x64-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
