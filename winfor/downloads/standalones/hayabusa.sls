# Name: Hayabusa
# Website: https://github.com/Yamato-Security/hayabusa
# Description: Windows event log fast forensics timeline generator and threat hunting tool 
# Category: Logs
# Author: Yamato Security
# License: GNU General Public License v3.0 (https://github.com/Yamato-Security/hayabusa/blob/main/LICENSE.txt)
# Version: 3.3.0
# Notes:

{% set version = '3.3.0' %}
{% set hash = '37bee154170429d272f3c5b228957d62c116d44cd52e6d3fb24e4b49785d6bbd' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

hayabusa-download-only:
  file.managed:
    - name: '{{ downloads }}\hayabusa\hayabusa-{{ version }}-win-x64.zip'
    - source: https://github.com/Yamato-Security/hayabusa/releases/download/v{{ version }}/hayabusa-{{ version }}-win-x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True    
