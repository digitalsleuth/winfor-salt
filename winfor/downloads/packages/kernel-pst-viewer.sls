# Name: Kernel PST Viewer
# Website: https://www.nucleustechnologies.com                             
# Description: Free Outlook PST viewer     
# Category: Email
# Author: Nucleus Technologies
# License: EULA (https://www.nucleustechnologies.com/eula.pdf)
# Version: 20.3
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '20.3' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('kernel-pst-viewer') %}

kernel-pst-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\kernel\kernel-pst-viewer-{{ version }}.exe'
    - source: https://www.nucleustechnologies.com/downloads/freekernelpstviewer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
