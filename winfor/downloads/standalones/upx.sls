# Name: UPX
# Website: https://github.com/upx/upx
# Description: The Ultimate Packer for eXecutables
# Category: Executables
# Author: Markus Oberhumer, Laszlo Molnar, John Reiser
# License: Multiple Licenses (https://github.com/upx/upx/blob/devel/LICENSE)
# Version: 5.3.0
# Notes: 

{% set version = '5.3.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('upx') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

upx-download-only:
  file.managed:
    - name: '{{ downloads }}\upx\upx-{{ version }}.zip'
    - source: https://github.com/upx/upx/releases/download/v{{ version }}/upx-{{ version }}-win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
