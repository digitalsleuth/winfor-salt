# Name: Volatility Workbench
# Website: https://www.osforensics.com/tools/volatility-workbench.html
# Description: Windows-based GUI for the Volatility 3 Framework
# Category: Windows Analysis
# Author: OSForensics
# License: Volatility Software License (https://www.volatilityfoundation.org/license/vsl-v1.0)
# Version: 3.0.1011
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.0.1011' %}
{% set hash = 'e2225ee260a5ee5ed2151016d57d76459bcdf5e84ead4325e34947913b557428' %}

volatility-workbench-download-only:
  file.managed:
    - name: '{{ downloads }}\volatility-workbench\VolatilityWorkbench-{{ version }}.zip'
    - source: https://www.osforensics.com/downloads/VolatilityWorkbench.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
