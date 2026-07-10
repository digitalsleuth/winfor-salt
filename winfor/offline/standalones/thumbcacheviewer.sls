# Name: ThumbCache Viewer
# Website: https://thumbcacheviewer.github.io/
# Description: Windows Thumbnail Cache parser
# Category: Windows Analysis
# Author: Eric Kutcher
# License: GNU General Public License v3.0 (identified within program)
# Version: 1.0.4.0
# Notes:

{% set version = '1.0.4.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'thumbcacheviewer-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\thumbcacheviewer\\' + pkg) %}

{% if exists %}

thumbcacheviewer-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\thumbcacheviewer\'
    - source: '{{ downloads }}\thumbcacheviewer\{{ pkg }}'
    - enforce_toplevel: False

thumbcacheviewer-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ThumbCache Viewer.lnk'
    - target: '{{ inpath }}\thumbcacheviewer\thumbcache_viewer.exe'
    - force: True
    - working_dir: '{{ inpath }}\thumbcacheviewer\'
    - makedirs: True
    - require:
      - archive: thumbcacheviewer-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
