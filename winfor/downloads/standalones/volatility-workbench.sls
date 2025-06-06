# Name: Volatility Workbench
# Website: https://www.osforensics.com/tools/volatility-workbench.html
# Description: Windows-based GUI for the Volatility 3 Framework
# Category: Windows Analysis
# Author: OSForensics
# License: Volatility Software License (https://www.volatilityfoundation.org/license/vsl-v1.0)
# Version: 3.0.1012
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.0.1012' %}
{% set hash = '504fac7da924fd2b0f8cb7620964f79c8e7d04c46c2af995e0de48464b28bb31' %}

volatility-workbench-download-only:
  file.managed:
    - name: '{{ downloads }}\volatility-workbench\VolatilityWorkbench-{{ version }}.zip'
    - source: https://www.osforensics.com/downloads/VolatilityWorkbench.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
