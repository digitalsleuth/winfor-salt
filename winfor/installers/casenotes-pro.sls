# Name: CaseNotes Pro
# Website: https://first-response.co.uk/
# Description: Tool to record and track case notes
# Category: Utilities
# Author: First Response
# License: EULA
# Version: 2.18.4.3
# Notes:

{% set version = '2.18.4.3' %}
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('casenotes-pro') %}

include:
  - winfor.config.user
  - winfor.packages.ms-vcpp-2010-redist-x64

casenotes-pro-download:
  file.managed:
    - name: 'C:\salt\tempdownload\CaseNotesInstaller.zip'
    - source: https://github.com/finbarr996/First-Response-CaseNotes/releases/download/{{ version }}/CaseNotesInstaller.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

casenotes-pro-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload\'
    - source: 'C:\salt\tempdownload\CaseNotesInstaller.zip'
    - enforce_toplevel: False
    - require:
      - file: casenotes-pro-download

casenotes-pro-install:
  cmd.run:
    - name: 'msiexec /i "CaseNotes Setup.msi" /qn /norestart'
    - cwd: 'C:\salt\tempdownload\'
    - require:
      - sls: winfor.packages.ms-vcpp-2010-redist-x64

casenotes-icons-remove:
  file.absent:
    - names:
      - 'C:\Users\{{ user }}\Desktop\CaseNotes Professional.lnk'
      - 'C:\Users\{{ user }}\Desktop\CaseNotes Professional Manual.pdf.lnk'
    - require:
      - cmd: casenotes-pro-install
      - user: user-{{ user }}
