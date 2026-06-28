# Name: VLC Media Player
# Website: https://www.videolan.org/
# Description: Media Player
# Category: Utilities
# Author: VideoLAN
# License: GNU General Public License v2 (https://www.videolan.org/legal.html)
# Version: 3.0.23
# Notes: https://mirror.clarkson.edu/videolan/vlc/version/win64/vlc-version-win64.exe

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.0.23' %}
{% set hash = '20ad191348684b470ddc4e05204316f3d8e39655f412b3e392a0eef97639daaf' %}

vlc-download-only:
  file.managed:
    - name: '{{ downloads }}\vlc\vlc-{{ version }}.exe'
    - source: https://get.videolan.org/vlc/{{ version }}/win64/vlc-{{ version }}-win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
