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
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

thumbcacheviewer-download:
  file.managed:
    - name: 'C:\salt\tempdownload\thumbcache_viewer_64.zip'
    - source: https://github.com/thumbcacheviewer/thumbcacheviewer/releases/download/v{{ version }}/thumbcache_viewer_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

thumbcacheviewer-extract:
  archive.extracted:
    - name: '{{ inpath }}\thumbcacheviewer\'
    - source: 'C:\salt\tempdownload\thumbcache_viewer_64.zip'
    - enforce_toplevel: False
    - require:
      - file: thumbcacheviewer-download

thumbcacheviewer-env:
  win_path.exists:
    - name: '{{ inpath }}\thumbcacheviewer\'

thumbcacheviewer-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ThumbCache Viewer.lnk'
    - target: '{{ inpath }}\thumbcacheviewer\thumbcache_viewer.exe'
    - force: True
    - working_dir: '{{ inpath }}\thumbcacheviewer\'
    - makedirs: True
    - require:
      - archive: thumbcacheviewer-extract