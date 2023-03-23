# Name: 4n6 Email Forensics
# Website: https://forensiksoft.com
# Description: Email forensics utility
# Category: Email
# Author: 4n6 Software
# License: https://forensiksoft.com/terms/
# Version: 7.5
# Notes:

{% set hash = 'c3af2d8ac883f12ed1b07a92c5c405d17f3ed8b5e4bb8b88bb4ff86e7c8d5ceb' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

4n6-email-forensics-wizard-download-only:
  file.managed:
    - name: '{{ downloads }}\setup-email-forensics-wizard.exe'
    - source: https://forensiksoft.com/tools/setup-email-forensics-wizard.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
