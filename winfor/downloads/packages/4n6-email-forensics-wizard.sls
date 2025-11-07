# Name: 4n6 Email Forensics
# Website: https://forensiksoft.com
# Description: Email forensics utility
# Category: Email
# Author: 4n6 Software
# License: https://forensiksoft.com/terms/
# Version: 7.6
# Notes:

{% set hash = 'aa0baad06c45e34e393ff6fb8451448b6a9b801a29af0cb6a492d708f505e115' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.6' %}

4n6-email-forensics-wizard-download-only:
  file.managed:
    - name: '{{ downloads }}\4n6-email-forensics\setup-email-forensics-wizard-{{ version }}.exe'
    - source: https://forensiksoft.com/tools/setup-email-forensics-wizard.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
