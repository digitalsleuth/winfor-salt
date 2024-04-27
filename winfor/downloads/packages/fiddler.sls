# Name: Telerik Fiddler
# Website: https://www.telerik.com
# Description: Web debugging proxy tool
# Category: Network
# Author: Telerik
# License: 
# Version: 5.0.20242.10753
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.0.20242.10753' %}
{% set hash = '06812518a722af6f98fbd8c3a5ace0cad1c6d53477972618728e64bafcbc948c' %}

fiddler-download-only:
  file.managed:
    - name: '{{ downloads }}\fiddler\FiddlerSetup-{{ version }}.exe'
    - source: https://telerik-fiddler.s3.amazonaws.com/fiddler/FiddlerSetup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
