# Name: Active Disk Editor
# Website: https://www.disk-editor.org
# Description: File / Disk Editor and Template Manager
# Category: Acquisition and Analysis
# Author: LSoft Technologies
# License: https://www.lsoft.net/terms/
# Version: 26.1.3
# Notes: 

{% set version = '26.1.3' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

active-disk-editor-offline:
  cmd.run:
    - name: 'diskeditor-freeware-{{ version }}.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    - shell: cmd
    - cwd: '{{ downloads }}\active-disk-editor'
