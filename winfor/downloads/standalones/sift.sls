# Name: sift
# Website: https://sift-tool.org/
# Description: A fast and powerful alternative to grep
# Category: Raw Parsers / Decoders
# Author: Sven Taute
# License: GNU General Public License v3.0 (https://github.com/svent/sift/blob/master/LICENSE)
# Version: 0.9.2
# Notes:

{% set version = '0.9.2' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '3ddcc65ffb90381019e6bcf0f928ecc116f299aa6a45badfae2f44317f85381c' %}

sift-download-only:
  file.managed:
    - name: '{{ downloads }}\sift\sift-{{ version }}.zip'
    - source: https://github.com/svent/sift/releases/download/v{{ version }}/sift_{{ version }}_Windows_x86_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
