# Name: File Insight
# Website: https://www.trellix.com
# Description: Static file analysis tool
# Category: Executables
# Author: McAfee / Trellix
# License: Software Royalty-Free License (https://www.trellix.com/en-us/downloads/free-tools/terms-of-use.html)
# Version: 3.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('fileinsight') %}

fileinsight-download-only:
  file.managed:
    - name: '{{ downloads }}\fileinsight\fileinsight-{{ version }}.msi'
    - source: https://github.com/digitalsleuth/salt-winrepo-ng/raw/main/files/fileinsight.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
