# Name: Aid4Mail
# Website: https://www.aid4mail.com
# Description: Email conversion and analysis
# Category: Email
# Author: Fookes Software Ltd
# License: Copyright (https://www.aid4mail.com/terms)
# Version: 5.1.8 (https://www.aid4mail.com/support/solutions/articles/aid4mail-5-version-history)
# Notes: Free Trial / Limited Free Conversion

{% set version = '5.1.8' %}
{% set hash = '85def03a8fbfe07777d129324a5b66d664e6e36a7e177ac6c4a385272134b6cc' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

aid4mail-download-only:
  file.managed:
    - name: '{{ downloads }}\aid4mail\Aid4Mail5_Setup-{{ version }}.zip'
    - source: https://www.aid4mail.com/download/Aid4Mail5_Setup.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
