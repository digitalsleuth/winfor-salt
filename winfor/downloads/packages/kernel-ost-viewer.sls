# Name: Kernel OST Viewer
# Website: https://www.nucleustechnologies.com                             
# Description: Free Outlook OST viewer     
# Category: Email
# Author: Nucleus Technologies
# License: EULA (https://www.nucleustechnologies.com/eula.pdf)
# Version: 21.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '21.1' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('kernel-ost-viewer') %}

kernel-ost-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\kernel\kernel-ost-viewer-{{ version }}.exe'
    - source: https://www.nucleustechnologies.com/downloads/freekernelostviewer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
