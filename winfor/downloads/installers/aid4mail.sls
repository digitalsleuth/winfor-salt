# Name: Aid4Mail
# Website: https://www.aid4mail.com
# Description: Email conversion and analysis
# Category: Email
# Author: Fookes Software Ltd
# License: Copyright (https://www.aid4mail.com/terms)
# Version: 5.1.6 build 902
# Notes: Free Trial / Limited Free Conversion

{% set version = '5.1.6' %}
{% set hash = 'fd040ccaa8f574278d13018fb89a98097206a317144652d99cc198ab49ea06cb' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

aid4mail-download-only:
  file.managed:
    - name: '{{ downloads }}\aid4mail\Aid4Mail5_Setup-{{ version }}.zip'
    - source: https://www.aid4mail.com/download/Aid4Mail5_Setup.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
