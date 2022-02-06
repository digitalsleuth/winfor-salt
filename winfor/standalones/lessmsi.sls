# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set versions = [('1.10.0', 'fdf6a3aab9c893966057004b64e2931af431a3459d323666e2e75c33a6825816')] %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

lessmsi-download:
  file.managed:
  {% for version, hash in versions %}
    - name: 'C:\salt\tempdownload\lessmsi-v{{ version }}.zip'
    - source: https://github.com/activescott/lessmsi/releases/download/v{{ version }}/lessmsi-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

lessmsi-extract:
  archive.extracted:
    - name: 'C:\standalone\lessmsi'
    - source: 'C:\salt\tempdownload\lessmsi-v{{ version }}.zip'
    - enforce_toplevel: False
  {% endfor %}

lessmsi-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\lessmsi.lnk'
    - target: 'C:\standalone\lessmsi\lessmsi-gui.exe'
    - force: True
    - working_dir: 'C:\standalone\lessmsi\'
    - makedirs: True
    - require:
      - file: lessmsi-download
      - archive: lessmsi-extract
