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
{% set hash = '005fe63e3942d772f82ec4df935002aedb8bbbf10fc95be086c029a2f3c875a9' %}

fileinsight-download-only:
  file.managed:
    - name: '{{ downloads }}\fileinsight.msi'
    - source: https://github.com/digitalsleuth/salt-winrepo-ng/raw/main/files/fileinsight.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
