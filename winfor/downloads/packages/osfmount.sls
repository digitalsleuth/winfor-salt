# Name: OSFMount
# Website: https://www.osforensics.com/tools/mount-disk-images.html
# Description: Drive / Disk / Image mounting tool
# Category: Acquisition and Analysis
# Author: PassMark
# License: Free (EULA, contained in software)
# Version: 3.1
# Notes: 

{% set hash = 'a67e2d31ce96488ede8d9cdd896d368821aad4cbbd9a78d394ed29ac17a13914' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

osfmount-download-only:
  file.managed:
    - name: '{{ downloads }}\osfmount.exe'
    - source: https://www.osforensics.com/downloads/osfmount.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
