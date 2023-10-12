# Name: Shadow Explorer
# Website: https://www.shadowexplorer.com
# Description: Windows Volume Shadow Copy viewer
# Category: Windows Analysis
# Author: ShadowExplorer
# License: 
# Version: 0.9.462.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '92590121920b130a7787c25036d17cf4bd188f1de7cfac6d98c254eef531bb92' %}

shadow-explorer-download-only:
  file.managed:
    - name: '{{ downloads }}\shadow-explorer\ShadowExplorer-0.9-portable.zip'
    - source: https://www.shadowexplorer.com/uploads/ShadowExplorer-0.9-portable.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
