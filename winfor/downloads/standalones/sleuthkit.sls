# Name: The Sleuth Kit
# Website: https://github.com/sleuthkit/sleuthkit/
# Description: Library and collection of command line DFIR tools
# Category: Windows Analysis
# Author: Brian Carrier
# License: Multiple Licenses (https://www.sleuthkit.org/sleuthkit/licenses.php)
# Version: 4.14.0
# Notes: 

{% set version = '4.14.0' %}
{% set hash = '76a803a0dbbe203cf19c79e583413a2aa470aaf1f6349488f35d3ef7cb779a2a' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

sleuthkit-download-only:
  file.managed:
    - name: '{{ downloads }}\sleuthkit\sleuthkit-{{ version }}-win32.zip'
    - source: https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-{{ version }}/sleuthkit-{{ version }}-win32.zip
    - source_hash: {{ hash }}
    - makedirs: True
