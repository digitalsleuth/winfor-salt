# Name: The Sleuth Kit
# Website: https://github.com/sleuthkit/sleuthkit/
# Description: Library and collection of command line DFIR tools
# Category: Windows Analysis
# Author: Brian Carrier
# License: Multiple Licenses (https://www.sleuthkit.org/sleuthkit/licenses.php)
# Version: 4.12.1
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '4.12.1' %}
{% set hash = '1653d69a537c7b7f1e68ca25c63ff61c765562925cf17ecbf15fae7211e87269' %}

include:
  - winfor.packages.strawberryperl

sleuthkit-download:
  file.managed:
    - name: 'C:\salt\tempdownload\sleuthkit-{{ version }}-win32.zip'
    - source: https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-{{ version }}/sleuthkit-{{ version }}-win32.zip
    - source_hash: {{ hash }}
    - makedirs: True

sleuthkit-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload\'
    - source: 'C:\salt\tempdownload\sleuthkit-{{ version }}-win32.zip'
    - enforce_toplevel: False
    - require:
      - file: sleuthkit-download
      - sls: winfor.packages.strawberryperl

sleuthkit-folder-rename:
  file.rename:
    - name: '{{ inpath }}\sleuthkit'
    - source: 'C:\salt\tempdownload\sleuthkit-{{ version }}-win32\'
    - force: True
    - makedirs: True
    - require:
      - archive: sleuthkit-extract

sleuthkit-mactime-wrapper:
  file.managed:
    - name: '{{ inpath }}\sleuthkit\bin\mactime.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - perl {{ inpath }}\sleuthkit\bin\mactime.pl %*

'{{ inpath }}\sleuthkit\bin':
  win_path.exists
