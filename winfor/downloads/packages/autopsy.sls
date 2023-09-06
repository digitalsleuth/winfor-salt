# Name: Autopsy
# Website: https://www.sleuthkit.org
# Description: GUI based application for image analysis
# Category: Acquisition and Analysis
# Author: Brian Carrier / Basis Technology
# License: Apache 2.0 (https://github.com/sleuthkit/autopsy/blob/master/README.txt)
# Version: 4.21.0
# Notes: 

{% set version = '4.21.0' %}
{% set hash = '8401a11e0e276274f078eb613ce8494dd894617d436ba326be1cda0d2fd8ef0a' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

autopsy-download-only:
  file.managed:
    - name: '{{ downloads }}\autopsy-{{ version }}-64bit.msi'
    - source: https://github.com/sleuthkit/autopsy/releases/download/autopsy-{{ version }}/autopsy-{{ version }}-64bit.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
