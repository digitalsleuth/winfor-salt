# Name: The Sleuth Kit
# Website: https://github.com/sleuthkit/sleuthkit/
# Description: Library and collection of command line DFIR tools
# Category: Windows Analysis
# Author: Brian Carrier
# License: Multiple Licenses (https://www.sleuthkit.org/sleuthkit/licenses.php)
# Version: 4.12.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '4.12.0' %}
{% set hash = 'e81b57d093f3b5e248f149a54abba1f53b24510973eebd5e931edf58a77b529d' %}

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
