# Name: ThumbCache Viewer
# Website: https://thumbcacheviewer.github.io/
# Description: Windows Thumbnail Cache parser
# Category: Windows Analysis
# Author: Eric Kutcher
# License: GNU General Public License v3.0 (identified within program)
# Version: 1.0.4.0
# Notes:

{% set version = '1.0.4.0' %}
{% set hash = '8d91a3156318ed26df11202a86dc0b53e2d85fd7e2cb02caf67f2fb63006e5ed' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

thumbcacheviewer-download-only:
  file.managed:
    - name: '{{ downloads }}\thumbcache-viewer\thumbcache_viewer_64-{{ version }}.zip'
    - source: https://github.com/thumbcacheviewer/thumbcacheviewer/releases/download/v{{ version }}/thumbcache_viewer_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
