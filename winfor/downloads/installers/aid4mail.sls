# Name: Aid4Mail
# Website: https://www.aid4mail.com
# Description: Email conversion and analysis
# Category: Email
# Author: Fookes Software Ltd
# License: Copyright (https://www.aid4mail.com/terms)
# Version: 6.1.3 (https://www.aid4mail.com/support/solutions/articles/aid4mail-version-history)
# Notes: Free Trial / Limited Free Conversion

{% set version = '6.1.3' %}
{% set hash = 'a7c63abb94ca036d4fad4630ddb6651b66ca3e0291e50d639bcdc666fd89beb2' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

aid4mail-download-only:
  file.managed:
    - name: '{{ downloads }}\aid4mail\Aid4Mail6_Setup-{{ version }}.zip'
    - source: https://www.aid4mail.com/download/Aid4Mail6_Setup.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
