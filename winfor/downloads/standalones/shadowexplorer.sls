# Name: Shadow Explorer
# Website: https://www.shadowexplorer.com
# Description: Windows Volume Shadow Copy viewer
# Category: Windows Analysis
# Author: ShadowExplorer
# License: 
# Version: 0.9.462.0
# Notes: 

{% set version = '0.9.462.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('shadowexplorer') %}

include:
  - winfor.downloads.packages.dotnetfx35

shadow-explorer-download-only:
  file.managed:
    - name: '{{ downloads }}\shadowexplorer\shadowexplorer-{{ version }}.zip'
    - source: https://www.shadowexplorer.com/uploads/ShadowExplorer-0.9-portable.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
