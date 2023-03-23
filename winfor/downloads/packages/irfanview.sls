# Name: IrfanView x64
# Website: https://www.irfanview.com/64bit.htm
# Description: IrfanView image viewer and editor
# Category: Utilities
# Author: Irfan Skiljan
# License: https://www.irfanview.com/eula.htm
# Version: 4.62
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '462' %}
{% set hash = 'd9d4c5f3120a9420e2dbaf0ee8931556e161787fbc4297d5fb4e4c7616fdd668' %}

irfanview-download-only:
  file.managed:
    - name: '{{ downloads }}\iview{{ version }}_x64_setup.exe'
    - source: https://download.betanews.com/download/967963863-1/iview{{ version }}_x64_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
