# Name: Email Header Analyzer
# Website: https://github.com/cyberdefenders/email-header-analyzer
# Description: Python-based Email Header Analysis Tool
# Category: Email
# Author: Ahmed Shawky (lnxg33k)
# License: GNU General Public License v3.0 (https://github.com/cyberdefenders/email-header-analyzer/blob/master/LICENSE.md)
# Version: v1
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

email-header-analyzer-download-only:
  git.latest:
    - name: https://github.com/cyberdefenders/email-header-analyzer.git
    - target: '{{ downloads }}\email-header-analyzer'
    - rev: master
    - force_clone: True
    - force_reset: True
