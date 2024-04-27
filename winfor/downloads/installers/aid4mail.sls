# Name: Aid4Mail
# Website: https://www.aid4mail.com
# Description: Email conversion and analysis
# Category: Email
# Author: Fookes Software Ltd
# License: Copyright (https://www.aid4mail.com/terms)
# Version: 5.1.7 (https://www.aid4mail.com/support/solutions/articles/aid4mail-5-version-history)
# Notes: Free Trial / Limited Free Conversion

{% set version = '5.1.7' %}
{% set hash = '0d15cfedf9b9e26a5056b83073fcae74e9caca06bd20103729decd9dd8e50bdf' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

aid4mail-download-only:
  file.managed:
    - name: '{{ downloads }}\aid4mail\Aid4Mail5_Setup-{{ version }}.zip'
    - source: https://www.aid4mail.com/download/Aid4Mail5_Setup.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
