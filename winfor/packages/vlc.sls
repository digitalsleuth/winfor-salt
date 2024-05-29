# Name: VLC Media Player
# Website: https://www.videolan.org/
# Description: Media Player
# Category: Utilities
# Author: VideoLAN
# License: GNU General Public License v2 (https://www.videolan.org/legal.html)
# Version: 3.0.18
# Notes: 

include:
  - winfor.repos

vlc:
  pkg.installed

vlc-del-shortcut:
  file.absent:
    - names:
      - 'C:\Users\Public\Desktop\VLC media player.lnk'
    - require:
      - pkg: vlc
