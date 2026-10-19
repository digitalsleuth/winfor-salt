# Name: UniExtract2
# Website: https://github.com/Bioruebe/UniExtract2
# Description: Tool to extract files from installers
# Category: Installers
# Author: William Engelmann
# License: GNU General Public License v2 (https://github.com/Bioruebe/UniExtract2/blob/master/LICENSE)
# Version: 2.0.0-rc.3
# Notes: 

{% set version = '2.0.0-rc.3' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('uniextract2') %}

uniextract2-download:
  file.managed:
    - name: 'C:\salt\tempdownload\UniExtractRC3.zip'
    - source: https://github.com/Bioruebe/UniExtract2/releases/download/v{{ version }}/UniExtractRC3.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

uniextract2-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\UniExtractRC3.zip'
    - enforce_toplevel: False
    - require:
      - file: uniextract2-download

standalones-uniextract2-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\UniExtract.lnk'
    - target: '{{ inpath }}\uniextract\uniextract.exe'
    - force: True
    - working_dir: '{{ inpath }}\uniextract\'
    - makedirs: True
    - require:
      - file: uniextract2-download
      - archive: uniextract2-extract
