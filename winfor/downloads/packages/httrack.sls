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
{% set hash = 'ce12f0e0cd3a3807463c8c538808d613798b11d961a94eabf0ba9d67851106f3' %}

winhttrack-download-only:
  file.managed:
    - name: '{{ downloads }}\winhttrack\httrack_x64-{{ version }}.exe'
    - source: https://mirror.httrack.com/httrack_x64-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
