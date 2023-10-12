# Name: CaseNotes Pro
# Website: https://first-response.co.uk/
# Description: Tool to record and track case notes
# Category: Utilities
# Author: First Response
# License: EULA
# Version: 2.17.8.30
# Notes:

{% set version = '2.17.8.30' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

casenotes-pro-source-download-only:
  file.managed:
    - name: '{{ downloads }}\casenotes-pro\cnsetup-{{ version }}.msi'
    - source: https://github.com/digitalsleuth/winfor-salt/raw/main/winfor/files/cnsetup.msi
    - skip_verify: True
    - makedirs: True
