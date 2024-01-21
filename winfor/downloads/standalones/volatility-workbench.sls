# Name: Volatility Workbench
# Website: https://www.osforensics.com/tools/volatility-workbench.html
# Description: Windows-based GUI for the Volatility 3 Framework
# Category: Windows Analysis
# Author: OSForensics
# License: Volatility Software License (https://www.volatilityfoundation.org/license/vsl-v1.0)
# Version: 3.0.1006
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.0.1006' %}
{% set hash = 'f2cfa7153c3496e8cc0321742960b81dc0c700fc7d31b0e55167ad4f2c9e6cac' %}

volatility-workbench-download-only:
  file.managed:
    - name: '{{ downloads }}\volatility-workbench\VolatilityWorkbench-{{ version }}.zip'
    - source: https://www.osforensics.com/downloads/VolatilityWorkbench.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
