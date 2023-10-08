# Name: Aid4Mail
# Website: https://www.aid4mail.com
# Description: Email conversion and analysis
# Category: Email
# Author: Fookes Software Ltd
# License: Copyright (https://www.aid4mail.com/terms)
# Version: 5.1.3 build 889
# Notes: Free Trial / Limited Free Conversion

{% set version = '5.1.3' %}
{% set hash = '308ac9d06e3d594ebbce626d73c6f5bd5050f639a4fe4924038497d81361d3e8' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

aid4mail-download-only:
  file.managed:
    - name: 'C:\salt\tempdownload\Aid4Mail5_Setup.zip'
    - source: https://www.aid4mail.com/download/Aid4Mail5_Setup.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
