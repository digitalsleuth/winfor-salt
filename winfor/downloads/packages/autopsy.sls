# Name: Autopsy
# Website: https://www.sleuthkit.org
# Description: GUI based application for image analysis
# Category: Acquisition and Analysis
# Author: Brian Carrier / Basis Technology
# License: Apache 2.0 (https://github.com/sleuthkit/autopsy/blob/master/README.txt)
# Version: 4.20.0
# Notes: 

{% set version = '4.20.0' %}
{% set hash = 'cbd9be04885a88b52f37391da1367d1f75e942c8526dcb9c35fe9125642014a6' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

autopsy-download-only:
  file.managed:
    - name: '{{ downloads }}\autopsy-{{ version }}-64bit.msi'
    - source: https://github.com/sleuthkit/autopsy/releases/download/autopsy-{{ version }}/autopsy-{{ version }}-64bit.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
