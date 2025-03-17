# Name: Autopsy
# Website: https://www.sleuthkit.org
# Description: GUI based application for image analysis
# Category: Acquisition and Analysis
# Author: Brian Carrier / Basis Technology
# License: Apache 2.0 (https://github.com/sleuthkit/autopsy/blob/master/README.txt)
# Version: 4.22.0
# Notes: 

{% set version = '4.22.0' %}
{% set hash = '3071d1f92402fba84329cee59680cf940bdbec0d5ad8470655dc8f9ae0b93610' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

autopsy-download-only:
  file.managed:
    - name: '{{ downloads }}\autopsy\autopsy-{{ version }}-64bit.msi'
    - source: https://github.com/sleuthkit/autopsy/releases/download/autopsy-{{ version }}/autopsy-{{ version }}-64bit.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
