# Name: CaseNotes Pro
# Website: https://first-response.co.uk/
# Description: Tool to record and track case notes
# Category: Utilities
# Author: First Response
# License: EULA
# Version: 2.18.4.3
# Notes:

{% set version = '2.18.4.3' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}

include:
  - winfor.config.user
  - winfor.offline.packages.ms-vcpp-2010-redist-x64

casenotes-pro-extract-offline:
  archive.extracted:
    - name: '{{ downloads }}\casenotes-pro\'
    - source: '{{ downloads }}\casenotes-pro\CaseNotesInstaller-{{ version }}.zip'
    - enforce_toplevel: False

casenotes-pro-install-offline:
  cmd.run:
    - name: 'msiexec /i "CaseNotes Setup.msi" /qn /norestart'
    - cwd: '{{ downloads }}\casenotes-pro'
    - require:
      - sls: winfor.offline.packages.ms-vcpp-2010-redist-x64

casenotes-icons-remove-offline:
  file.absent:
    - names:
      - 'C:\Users\{{ user }}\Desktop\CaseNotes Professional.lnk'
      - 'C:\Users\{{ user }}\Desktop\CaseNotes Professional Manual.pdf.lnk'
    - require:
      - cmd: casenotes-pro-install-offline
      - user: user-{{ user }}
