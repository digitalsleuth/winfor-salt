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
{% set hash = '4e2eb12620d5c06822913b82decc1c44d272082ce75a266e0ec3ab4e38c52ab9' %}

kernel-pst-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\kernel\freekernelpstviewer-{{ version }}.exe'
    - source: https://www.nucleustechnologies.com/downloads/freekernelpstviewer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
