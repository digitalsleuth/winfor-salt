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
{% set hash = 'f3ec61fe2f01c121e7436cfb6440e839795c280382409fd454f7814f99a20638' %}

kernel-ost-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\freekernelostviewer.exe'
    - source: https://www.nucleustechnologies.com/downloads/freekernelostviewer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
