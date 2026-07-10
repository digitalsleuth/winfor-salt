# Name: Hayabusa
# Website: https://github.com/Yamato-Security/hayabusa
# Description: Windows event log fast forensics timeline generator and threat hunting tool 
# Category: Logs
# Author: Yamato Security
# License: GNU General Public License v3.0 (https://github.com/Yamato-Security/hayabusa/blob/main/LICENSE.txt)
# Version: 3.10.0
# Notes:

{% set version = '3.10.0' %}
{% set hash = '8dd2b2d124ce3f96d2fe63cd7a0ea4c54ad2984d820324c3388ec30f9c6b8209' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

hayabusa-download-only:
  file.managed:
    - name: '{{ downloads }}\hayabusa\hayabusa-{{ version }}.zip'
    - source: https://github.com/Yamato-Security/hayabusa/releases/download/v{{ version }}/hayabusa-{{ version }}-win-x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True    
