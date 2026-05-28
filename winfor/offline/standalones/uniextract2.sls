# Name: UniExtract2
# Website: https://github.com/Bioruebe/UniExtract2
# Description: Tool to extract files from installers
# Category: Installers
# Author: William Engelmann
# License: GNU General Public License v2 (https://github.com/Bioruebe/UniExtract2/blob/master/LICENSE)
# Version: 2.0.0-rc3
# Notes: 

{% set version = '2.0.0-rc.3' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

uniextract2-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\uniextract2\UniExtractRC3-{{ version }}.zip'
    - enforce_toplevel: False

uniextract2-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\UniExtract.lnk'
    - target: '{{ inpath }}\uniextract\uniextract.exe'
    - force: True
    - working_dir: '{{ inpath }}\uniextract\'
    - makedirs: True
    - require:
      - archive: uniextract2-extract-offline
