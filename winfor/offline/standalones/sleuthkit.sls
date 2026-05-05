# Name: The Sleuth Kit
# Website: https://github.com/sleuthkit/sleuthkit/
# Description: Library and collection of command line DFIR tools
# Category: Windows Analysis
# Author: Brian Carrier
# License: Multiple Licenses (https://www.sleuthkit.org/sleuthkit/licenses.php)
# Version: 4.15.0
# Notes: 

{% set version = '4.15.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

sleuthkit-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\sleuthkit\sleuthkit-{{ version }}-win32.zip'
    - enforce_toplevel: False

sleuthkit-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\sleuthkit'
    - source: '{{ inpath }}\sleuthkit-{{ version }}-win32\'
    - force: True
    - makedirs: True
    - require:
      - archive: sleuthkit-extract-offline

'{{ inpath }}\sleuthkit\bin':
  win_path.exists
