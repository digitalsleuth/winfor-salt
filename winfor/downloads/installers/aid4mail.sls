# Name: Aid4Mail
# Website: https://www.aid4mail.com
# Description: Email conversion and analysis
# Category: Email
# Author: Fookes Software Ltd
# License: Copyright (https://www.aid4mail.com/terms)
# Version: 6.3 (https://www.aid4mail.com/support/solutions/articles/aid4mail-version-history)
# Notes: Free Trial / Limited Free Conversion

{% set version = '6.3' %}
{% set hash = '5be9219d044e2fe664e838d759868219b7b1e399dfa8e6ab3791a5870709a251' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

aid4mail-download-only:
  file.managed:
    - name: '{{ downloads }}\aid4mail\aid4mail-{{ version }}.zip'
    - source: https://www.aid4mail.com/download/Aid4Mail6_Setup.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
