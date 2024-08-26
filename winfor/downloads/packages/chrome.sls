# Name: Google Chrome
# Website: https://www.google.com
# Description: Google Web Browser
# Category: Browsers
# Author: Google
# License: https://policies.google.com/terms
# Version: 108.0.5359.72
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

chrome-download-only:
  file.managed:
    - name: '{{ downloads }}\chrome\GoogleChromeStandaloneEnterprise64.msi'
    - source: https://dl.google.com/edgedl/chrome/install/GoogleChromeStandaloneEnterprise64.msi
    - skip_verify: True
    - makedirs: True
