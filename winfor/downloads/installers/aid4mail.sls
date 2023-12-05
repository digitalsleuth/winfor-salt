# Name: Aid4Mail
# Website: https://www.aid4mail.com
# Description: Email conversion and analysis
# Category: Email
# Author: Fookes Software Ltd
# License: Copyright (https://www.aid4mail.com/terms)
# Version: 5.1.5 build 895
# Notes: Free Trial / Limited Free Conversion

{% set version = '5.1.5' %}
{% set hash = 'da4f9fbc565f411deeddf28b3c59bfdeced3bf5d721f9e85ff9397fc193cc20b' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

aid4mail-download-only:
  file.managed:
    - name: '{{ downloads }}\aid4mail\Aid4Mail5_Setup-{{ version }}.zip'
    - source: https://www.aid4mail.com/download/Aid4Mail5_Setup.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
