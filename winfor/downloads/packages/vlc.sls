# Name: VLC Media Player
# Website: https://www.videolan.org/
# Description: Media Player
# Category: Utilities
# Author: VideoLAN
# License: GNU General Public License v2 (https://www.videolan.org/legal.html)
# Version: 3.0.21
# Notes: https://mirror.clarkson.edu/videolan/vlc/version/win64/vlc-version-win64.exe

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.0.21' %}
{% set hash = '9742689a50e96ddc04d80ceff046b28da2beefd617be18166f8c5e715ec60c59' %}

vlc-download-only:
  file.managed:
    - name: '{{ downloads }}\vlc\vlc-{{ version }}-win64.exe'
    - source: https://get.videolan.org/vlc/{{ version }}/win64/vlc-{{ version }}-win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
