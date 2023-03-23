# Name: Hayabusa
# Website: https://github.com/Yamato-Security/hayabusa
# Description: Windows event log fast forensics timeline generator and threat hunting tool 
# Category: Logs
# Author: Yamato Security
# License: GNU General Public License v3.0 (https://github.com/Yamato-Security/hayabusa/blob/main/LICENSE.txt)
# Version: 2.3.1
# Notes:

{% set version = '2.3.1' %}
{% set hash = 'f2a551a25afed0ea05338d93caaf945a8bd10704ffe9d45fb2db0bdbcf7a1cd8' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

hayabusa-download-only:
  file.managed:
    - name: '{{ downloads }}\hayabusa-{{ version }}-win-64-bit.zip'
    - source: https://github.com/Yamato-Security/hayabusa/releases/download/v{{ version }}/hayabusa-{{ version }}-win-64-bit.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True    
