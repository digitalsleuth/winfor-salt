# Name: UPX
# Website: https://github.com/upx/upx
# Description: The Ultimate Packer for eXecutables
# Category: Executables
# Author: Markus Oberhumer, Laszlo Molnar, John Reiser
# License: Multiple Licenses (https://github.com/upx/upx/blob/devel/LICENSE)
# Version: 5.1.1
# Notes: 

{% set version = '5.1.1' %}
{% set hash = 'fa5380bca4c2718547aaa0134bc0d8a7fa27e102f0ac6371573d60d1c21d64de' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

upx-download-only:
  file.managed:
    - name: '{{ downloads }}\upx\upx-{{ version }}-win64.zip'
    - source: https://github.com/upx/upx/releases/download/v{{ version }}/upx-{{ version }}-win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
