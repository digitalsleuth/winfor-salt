# Name: The Sleuth Kit
# Website: https://github.com/sleuthkit/sleuthkit/
# Description: Library and collection of command line DFIR tools
# Category: Windows Analysis
# Author: Brian Carrier
# License: Multiple Licenses (https://www.sleuthkit.org/sleuthkit/licenses.php)
# Version: 4.12.1
# Notes: 

{% set version = '4.12.1' %}
{% set hash = '1653d69a537c7b7f1e68ca25c63ff61c765562925cf17ecbf15fae7211e87269' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

sleuthkit-download-only:
  file.managed:
    - name: '{{ downloads }}\sleuthkit\sleuthkit-{{ version }}-win32.zip'
    - source: https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-{{ version }}/sleuthkit-{{ version }}-win32.zip
    - source_hash: {{ hash }}
    - makedirs: True
