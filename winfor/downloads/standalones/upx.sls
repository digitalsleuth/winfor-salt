# Name: UPX
# Website: https://github.com/upx/upx
# Description: The Ultimate Packer for eXecutables
# Category: Executables
# Author: Markus Oberhumer, Laszlo Molnar, John Reiser
# License: Multiple Licenses (https://github.com/upx/upx/blob/devel/LICENSE)
# Version: 4.1.0
# Notes: 

{% set version = '4.1.0' %}
{% set hash = '382cee168d6261a76c3b6a98b3ca2de44930bf5faa5f2dc2ced4fa3850fe8ff6' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

upx-download-only:
  file.managed:
    - name: '{{ downloads }}\upx\upx-{{ version }}-win64.zip'
    - source: https://github.com/upx/upx/releases/download/v{{ version }}/upx-{{ version }}-win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
