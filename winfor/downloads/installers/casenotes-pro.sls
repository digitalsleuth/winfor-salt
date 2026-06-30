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
{% set hash = '107c64c7c858aba9bc8d58a330b19943465f540e30fa33a953672826ad1b55ec' %}

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
