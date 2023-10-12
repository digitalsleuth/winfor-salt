# Name: ThumbCache Viewer
# Website: https://thumbcacheviewer.github.io/
# Description: Windows Thumbnail Cache parser
# Category: Windows Analysis
# Author: Eric Kutcher
# License: GNU General Public License v3.0 (identified within program)
# Version: 1.0.3.9
# Notes:

{% set version = '1.0.3.9' %}
{% set hash = '365df2f891febcba1552265be7927230ae7c526e6b4fa4df0494742bfb62df51' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

thumbcacheviewer-download-only:
  file.managed:
    - name: '{{ downloads }}\thumbcache-viewer\thumbcache_viewer_64-{{ version }}.zip'
    - source: https://github.com/thumbcacheviewer/thumbcacheviewer/releases/download/v{{ version }}/thumbcache_viewer_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
