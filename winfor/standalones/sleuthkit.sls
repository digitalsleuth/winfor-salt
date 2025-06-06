# Name: The Sleuth Kit
# Website: https://github.com/sleuthkit/sleuthkit/
# Description: Library and collection of command line DFIR tools
# Category: Windows Analysis
# Author: Brian Carrier
# License: Multiple Licenses (https://www.sleuthkit.org/sleuthkit/licenses.php)
# Version: 4.14.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '4.14.0' %}
{% set hash = '76a803a0dbbe203cf19c79e583413a2aa470aaf1f6349488f35d3ef7cb779a2a' %}

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

sleuthkit-folder-rename:
  file.rename:
    - name: '{{ inpath }}\sleuthkit'
    - source: 'C:\salt\tempdownload\sleuthkit-{{ version }}-win32\'
    - force: True
    - makedirs: True
    - require:
      - archive: sleuthkit-extract

'{{ inpath }}\sleuthkit\bin':
  win_path.exists
