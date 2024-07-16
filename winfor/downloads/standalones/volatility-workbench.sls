# Name: Volatility Workbench
# Website: https://www.osforensics.com/tools/volatility-workbench.html
# Description: Windows-based GUI for the Volatility 3 Framework
# Category: Windows Analysis
# Author: OSForensics
# License: Volatility Software License (https://www.volatilityfoundation.org/license/vsl-v1.0)
# Version: 3.0.1008
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.0.1008' %}
{% set hash = '06eb100ed10e9f1f4364b183a58b2c84cadfa5f621e15c43fbaf40cc2e69f3ac' %}

volatility-workbench-download-only:
  file.managed:
    - name: '{{ downloads }}\volatility-workbench\VolatilityWorkbench-{{ version }}.zip'
    - source: https://www.osforensics.com/downloads/VolatilityWorkbench.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
