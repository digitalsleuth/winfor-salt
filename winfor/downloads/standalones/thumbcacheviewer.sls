# Name: ThumbCache Viewer
# Website: https://thumbcacheviewer.github.io/
# Description: Windows Thumbnail Cache parser
# Category: Windows Analysis
# Author: Eric Kutcher
# License: GNU General Public License v3.0 (identified within program)
# Version: 1.0.4.0
# Notes:

{% set version = '1.0.4.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('thumbcacheviewer') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

thumbcacheviewer-download-only:
  file.managed:
    - name: '{{ downloads }}\thumbcacheviewer\thumbcacheviewer-{{ version }}.zip'
    - source: https://github.com/thumbcacheviewer/thumbcacheviewer/releases/download/v{{ version }}/thumbcache_viewer_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
