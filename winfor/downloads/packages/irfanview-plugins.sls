# Name: IrfanView x64 Plugins
# Website: https://www.irfanview.com/64bit.htm
# Description: IrfanView Plugins
# Category: Utilities
# Author: Irfan Skiljan
# License: https://www.irfanview.com/eula.htm
# Version: 4.73
# Notes:

{% set version = '473' %}
{% set hash = '79979C55958F473209E9B7BDDAF1410F0BF4C48BE6D2D02AE3BADEADCCF74DA3' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

irfanview-plugins-download-only:
  file.managed:
    - name: '{{ downloads }}\irfanview\iview{{ version }}_plugins_x64_setup.exe'
    - source: https://download.fileforum.com/download/1099412658-1/iview{{ version }}_plugins_x64_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
