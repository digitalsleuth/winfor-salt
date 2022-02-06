# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set version = '0.3.2' %}
{% set hash = '7f931291a8de51e4a6210283f6f3890c4576db50ed9300b2d57220ddaef0190e' %}

hollows-hunter-download:
  file.managed:
    - name: 'C:\standalone\hollows-hunter\hollows-hunter.exe'
    - source: https://github.com/hasherezade/hollows_hunter/releases/download/v{{ version }}/hollows_hunter64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

hollows-hunter-env-vars:
  win_path.exists:
    - name: 'C:\standalone\hollows-hunter\'
