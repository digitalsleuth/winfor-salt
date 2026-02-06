# Name: Aid4Mail
# Website: https://www.aid4mail.com
# Description: Email conversion and analysis
# Category: Email
# Author: Fookes Software Ltd
# License: Copyright (https://www.aid4mail.com/terms)
# Version: 6.2 (https://www.aid4mail.com/support/solutions/articles/aid4mail-version-history)
# Notes: Free Trial / Limited Free Conversion

{% set version = '6.2' %}
{% set hash = 'a45fd585824e98de15c63a8065f24019acbe6b64738152f22cc81b72673a9e98' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

aid4mail-download-only:
  file.managed:
    - name: '{{ downloads }}\aid4mail\Aid4Mail6_Setup-{{ version }}.zip'
    - source: https://www.aid4mail.com/download/Aid4Mail6_Setup.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
