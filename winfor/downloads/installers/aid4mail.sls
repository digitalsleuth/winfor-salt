# Name: Aid4Mail
# Website: https://www.aid4mail.com
# Description: Email conversion and analysis
# Category: Email
# Author: Fookes Software Ltd
# License: Copyright (https://www.aid4mail.com/terms)
# Version: 6.0.0 (https://www.aid4mail.com/support/solutions/articles/aid4mail-version-history)
# Notes: Free Trial / Limited Free Conversion

{% set version = '6.0.0' %}
{% set hash = '02704e2e10e44c74d0e1b235debec6bd22ae9e2ecd03f5e7207701c3b2bd1237' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

aid4mail-download-only:
  file.managed:
    - name: '{{ downloads }}\aid4mail\Aid4Mail6_Setup-{{ version }}.zip'
    - source: https://www.aid4mail.com/download/Aid4Mail6_Setup.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
