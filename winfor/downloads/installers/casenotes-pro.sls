# Name: CaseNotes Pro
# Website: https://first-response.co.uk/
# Description: Tool to record and track case notes
# Category: Utilities
# Author: First Response
# License: EULA
# Version: 2.18.4.3
# Notes:

{% set version = '2.18.4.3' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('casenotes-pro') %}

include:
  - winfor.downloads.packages.ms-vcpp-2010-redist-x64

casenotes-pro-download-only:
  file.managed:
    - name: '{{ downloads }}\casenotes-pro\casenotes-pro-{{ version }}.zip'
    - source: https://github.com/finbarr996/First-Response-CaseNotes/releases/download/{{ version }}/CaseNotesInstaller.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.downloads.packages.ms-vcpp-2010-redist-x64
