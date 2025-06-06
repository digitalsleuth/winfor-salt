# Name: UPX
# Website: https://github.com/upx/upx
# Description: The Ultimate Packer for eXecutables
# Category: Executables
# Author: Markus Oberhumer, Laszlo Molnar, John Reiser
# License: Multiple Licenses (https://github.com/upx/upx/blob/devel/LICENSE)
# Version: 5.0.1
# Notes: 

{% set version = '5.0.1' %}
{% set hash = 'c288989437ce70646a62799a4dcf25b4ec7ad8fbb4f93a29e25c14856659c1a4' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

upx-download-only:
  file.managed:
    - name: '{{ downloads }}\upx\upx-{{ version }}-win64.zip'
    - source: https://github.com/upx/upx/releases/download/v{{ version }}/upx-{{ version }}-win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
