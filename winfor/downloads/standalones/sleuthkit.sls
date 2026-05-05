# Name: The Sleuth Kit
# Website: https://github.com/sleuthkit/sleuthkit/
# Description: Library and collection of command line DFIR tools
# Category: Windows Analysis
# Author: Brian Carrier
# License: Multiple Licenses (https://www.sleuthkit.org/sleuthkit/licenses.php)
# Version: 4.15.0
# Notes: 

{% set version = '4.15.0' %}
{% set hash = 'c2ebab8105b893d97bd8ce35b88e01985e2a106efc97f03adf95840a631b20ce' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

sleuthkit-download-only:
  file.managed:
    - name: '{{ downloads }}\sleuthkit\sleuthkit-{{ version }}-win32.zip'
    - source: https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-{{ version }}/sleuthkit-{{ version }}-win32.zip
    - source_hash: {{ hash }}
    - makedirs: True
