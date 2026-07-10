# Name: FEX Cloud Capture
# Website: https://getdataforensics.com
# Description: Cloud Acquisition Tool
# Category: Acquisition and Analysis
# Author: GetData Forensics
# License: Free
# Version: 1.30
# Notes: 

{% set version = '1.30' %}
{% set hash = 'ea2c3ffbfcc2ab217f7fe78473544cae73f2b21c9af55ae1916d2b0cc16fa53f' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fex-cloud-capture-download-only:
  file.managed:
    - name: '{{ downloads }}\fex-cloud-capture\fex-cloud-capture-{{ version }}.zip'
    - source: https://download.getdata.com/support/fex/cloud/FEX-Cloud-Capture-64bit-(v{{ version }}).zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
