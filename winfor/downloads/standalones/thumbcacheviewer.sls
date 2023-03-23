# Name: ThumbCache Viewer
# Website: https://thumbcacheviewer.github.io/
# Description: Windows Thumbnail Cache parser
# Category: Windows Analysis
# Author: Eric Kutcher
# License: GNU General Public License v3.0 (identified within program)
# Version: 1.0.3.7
# Notes:

{% set version = '1.0.3.7' %}
{% set hash = '8DCE6A702545E11347CDC23A7BC3C67E284F332F4BDD1BB7319C4432EB598E90' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

thumbcacheviewer-download-only:
  file.managed:
    - name: '{{ downloads }}\thumbcache_viewer_64.zip'
    - source: https://github.com/thumbcacheviewer/thumbcacheviewer/releases/download/v{{ version }}/thumbcache_viewer_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
