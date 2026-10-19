# Name: Hayabusa
# Website: https://github.com/Yamato-Security/hayabusa
# Description: Windows event log fast forensics timeline generator and threat hunting tool 
# Category: Logs
# Author: Yamato Security
# License: GNU General Public License v3.0 (https://github.com/Yamato-Security/hayabusa/blob/main/LICENSE.txt)
# Version: 4.2.0
# Notes:

{% set version = '4.2.0' %}
{% set hash = 'e8e49805bf94f5feb425cffae904f526257c1b6bf8dedfa07c28e9aa585a387b' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

hayabusa-download-only:
  file.managed:
    - name: '{{ downloads }}\hayabusa\hayabusa-{{ version }}.zip'
    - source: https://github.com/Yamato-Security/hayabusa/releases/download/v{{ version }}/hayabusa-{{ version }}-win-x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True    
