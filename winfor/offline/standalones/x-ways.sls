# Name: X-Ways Forensics
# Website: https://x-ways.net
# Description: Forensic Analysis Software
# Category: Acquisition and Analysis
# Author: Stefan Fleischmann
# License: License Dependent - https://www.x-ways.net/terminology.html
# Version: 21.3
# Notes:

{% set version = "21.3" %}
{% set xviewer_ver = "857" %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'xways-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\x-ways\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.standalones.x-ways-templates

xways-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\xwf\'
    - source: '{{ downloads }}\x-ways\{{ pkg }}'
    - enforce_toplevel: False

xways-viewer-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\xwf\'
    - source: '{{ downloads }}\x-ways\xw_viewer_{{ xviewer_ver }}.zip'
    - enforce_toplevel: False
    - require:
      - archive: xways-extract-offline

xways-tesseract-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\xwf\'
    - source: '{{ downloads }}\x-ways\Tesseract.zip'
    - enforce_toplevel: False
    - require:
      - archive: xways-extract-offline

xways-mplayer-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\xwf\'
    - source: '{{ downloads }}\x-ways\MPlayer_2022_x64.zip'
    - enforce_toplevel: False
    - require:
      - archive: xways-extract-offline

xways-manual-copy-offline:
  file.managed:
    - name: '{{ inpath }}\xwf\manual.pdf'
    - source: '{{ downloads }}\x-ways\xways_manual.pdf'
    - require:
      - archive: xways-extract-offline

xways-winhex-binary-offline:
  file.copy:
    - name: '{{ inpath }}\xwf\winhex.exe'
    - source: '{{ inpath }}\xwf\xwforensics.exe'
    - require:
      - archive: xways-extract-offline

xways-winhex64-binary-offline:
  file.copy:
    - name: '{{ inpath }}\xwf\winhex64.exe'
    - source: '{{ inpath }}\xwf\xwforensics64.exe'
    - require:
      - archive: xways-extract-offline

xways-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\X-Ways.lnk'
    - target: '{{ inpath }}\xwf\xwforensics64.exe'
    - force: True
    - working_dir: '{{ inpath }}\xwf\'
    - makedirs: True
    - require:
      - archive: xways-extract-offline

winhex-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\WinHex.lnk'
    - target: '{{ inpath }}\xwf\winhex64.exe'
    - force: True
    - working_dir: '{{ inpath }}\xwf\'
    - makedirs: True
    - require:
      - archive: xways-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
