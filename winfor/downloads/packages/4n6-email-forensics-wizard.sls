# Name: 4n6 Email Forensics
# Website: https://forensiksoft.com
# Description: Email forensics utility
# Category: Email
# Author: 4n6 Software
# License: https://forensiksoft.com/terms/
# Version: 7.6
# Notes:

{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('4n6-email-forensics-wizard') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.6' %}

include:
  - winfor.downloads.packages.ms-vcpp-2010-redist-x86

4n6-email-forensics-wizard-download-only:
  file.managed:
    - name: '{{ downloads }}\4n6-email-forensics\4n6-email-forensics-{{ version }}.exe'
    - source: https://forensiksoft.com/tools/setup-email-forensics-wizard.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.downloads.packages.ms-vcpp-2010-redist-x86
