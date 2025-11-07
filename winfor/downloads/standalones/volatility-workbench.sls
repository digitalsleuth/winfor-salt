# Name: Volatility Workbench
# Website: https://www.osforensics.com/tools/volatility-workbench.html
# Description: Windows-based GUI for the Volatility 3 Framework
# Category: Windows Analysis
# Author: OSForensics
# License: Volatility Software License (https://www.volatilityfoundation.org/license/vsl-v1.0)
# Version: 3.0.1014
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.0.1014' %}
{% set hash = 'a9d9b6944b77a9d9a14180d5f173767e756c27a29cb810ebb27e285c39c1dcf9' %}

volatility-workbench-download-only:
  file.managed:
    - name: '{{ downloads }}\volatility-workbench\VolatilityWorkbench-{{ version }}.zip'
    - source: https://www.osforensics.com/downloads/VolatilityWorkbench.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
