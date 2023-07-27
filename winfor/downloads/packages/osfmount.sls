# Name: OSFMount
# Website: https://www.osforensics.com/tools/mount-disk-images.html
# Description: Drive / Disk / Image mounting tool
# Category: Acquisition and Analysis
# Author: PassMark
# License: Free (EULA, contained in software)
# Version: 3.1
# Notes: 

{% set hash = 'fd4012a9df1e1fcd93e473e4498e51d19a2afd9379cd657db1cc023e3c0dc7d6' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

osfmount-download-only:
  file.managed:
    - name: '{{ downloads }}\osfmount.exe'
    - source: https://www.osforensics.com/downloads/osfmount.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
