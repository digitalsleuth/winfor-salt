# Name: OfficeMalScanner
# Website: http://www.reconstructer.org/main.html
# Description: Office Document analysis tool to detect implants and malware
# Category: Documents / Editors
# Author: Frank Boldewin
# License: Unknown
# Version: 0.62
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.62' %}

officemalscanner-download-only:
  file.managed:
    - name: '{{ downloads }}\officemalscanner\OfficeMalScanner-{{ version }}.zip'
    - source: salt://winfor/files/OfficeMalScanner.zip
    - source_hash: sha256=d84bb67485ee73f7b1666b39ba01b80e31cf2021b85671dd036858053be65c1e
    - makedirs: True
