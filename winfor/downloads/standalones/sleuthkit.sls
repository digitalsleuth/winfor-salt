# Name: The Sleuth Kit
# Website: https://github.com/sleuthkit/sleuthkit/
# Description: Library and collection of command line DFIR tools
# Category: Windows Analysis
# Author: Brian Carrier
# License: Multiple Licenses (https://www.sleuthkit.org/sleuthkit/licenses.php)
# Version: 4.12.0
# Notes: 

{% set version = '4.12.0' %}
{% set hash = 'e81b57d093f3b5e248f149a54abba1f53b24510973eebd5e931edf58a77b529d' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

sleuthkit-download-only:
  file.managed:
    - name: '{{ downloads }}\sleuthkit-{{ version }}-win32.zip'
    - source: https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-{{ version }}/sleuthkit-{{ version }}-win32.zip
    - source_hash: {{ hash }}
    - makedirs: True
