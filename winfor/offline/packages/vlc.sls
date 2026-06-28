# Name: VLC Media Player
# Website: https://www.videolan.org/
# Description: Media Player
# Category: Utilities
# Author: VideoLAN
# License: GNU General Public License v2 (https://www.videolan.org/legal.html)
# Version: 3.0.23
# Notes: https://mirror.clarkson.edu/videolan/vlc/version/win64/vlc-version-win64.exe

{% set version = '3.0.23' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'vlc-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\vlc\\' + pkg) %}

{% if exists %}
vlc-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S'
    - shell: cmd
    - cwd: '{{ downloads }}\vlc\'

vlc-icon-remove-offline:
  file.absent:
    - name: 'C:\Users\Public\Desktop\VLC media player.lnk'
    - require:
      - cmd: vlc-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
