# Name: UPX
# Website: https://github.com/upx/upx
# Description: The Ultimate Packer for eXecutables
# Category: Executables
# Author: Markus Oberhumer, Laszlo Molnar, John Reiser
# License: Multiple Licenses (https://github.com/upx/upx/blob/devel/LICENSE)
# Version: 5.2.1
# Notes: 

{% set version = '5.2.1' %}
{% set hash = 'eabc6792a347d45e945be7748423e7868fd01b0d2bcaa2f4b1031fd71ff69bda' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

upx-download-only:
  file.managed:
    - name: '{{ downloads }}\upx\upx-{{ version }}.zip'
    - source: https://github.com/upx/upx/releases/download/v{{ version }}/upx-{{ version }}-win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
