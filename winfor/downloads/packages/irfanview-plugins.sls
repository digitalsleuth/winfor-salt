# Name: IrfanView x64 Plugins
# Website: https://www.irfanview.com/64bit.htm
# Description: IrfanView Plugins
# Category: Utilities
# Author: Irfan Skiljan
# License: https://www.irfanview.com/eula.htm
# Version: 4.73
# Notes:

{% set version = '473' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('irfanview-plugins') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

irfanview-plugins-download-only:
  file.managed:
    - name: '{{ downloads }}\irfanview\irfanview-plugins-{{ version }}.exe'
    - source: https://download.fileforum.com/download/1099412658-1/iview{{ version }}_plugins_x64_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
