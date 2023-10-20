# Name: Aid4Mail
# Website: https://www.aid4mail.com
# Description: Email conversion and analysis
# Category: Email
# Author: Fookes Software Ltd
# License: Copyright (https://www.aid4mail.com/terms)
# Version: 5.1.4 build 889
# Notes: Free Trial / Limited Free Conversion

{% set version = '5.1.4' %}
{% set hash = 'df599c5a421c663952f80cd27c0635d27c82b83b493e42e172f158806cc9c83e' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

aid4mail-download-only:
  file.managed:
    - name: '{{ downloads }}\aid4mail\Aid4Mail5_Setup-{{ version }}.zip'
    - source: https://www.aid4mail.com/download/Aid4Mail5_Setup.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
