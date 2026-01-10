# Name: Hayabusa
# Website: https://github.com/Yamato-Security/hayabusa
# Description: Windows event log fast forensics timeline generator and threat hunting tool 
# Category: Logs
# Author: Yamato Security
# License: GNU General Public License v3.0 (https://github.com/Yamato-Security/hayabusa/blob/main/LICENSE.txt)
# Version: 3.7.0
# Notes:

{% set version = '3.7.0' %}
{% set hash = '6c5ed99560d0896bb8a38d53f19da5958c461a519d78b989dfdc8462fbf8b227' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

hayabusa-download-only:
  file.managed:
    - name: '{{ downloads }}\hayabusa\hayabusa-{{ version }}-win-x64.zip'
    - source: https://github.com/Yamato-Security/hayabusa/releases/download/v{{ version }}/hayabusa-{{ version }}-win-x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True    
