# Name: HttpLogBrowser
# Website: https://www.finalanalytics.com/products/httplogbrowser
# Description: Web server log analyzer
# Category: Logs
# Author: FinalAnalytics
# License: EULA (https://www.finalanalytics.com/downloads/HttpLogBrowser-EULA.pdf)
# Version: 4.6.2.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '4.6.2.0' %}
{% set hash = 'D5AC49BB17C0FF594FC96F5FD6729C93B5DE6AF694F6837DC5D7980EFC81BCD4' %}

httplogbrowser-download-only:
  file.managed:
    - name: '{{ downloads }}\httplogbrowser\HttpLogBrowser-Setup-{{ version }}.exe'
    - source: https://www.finalanalytics.com/downloads/HttpLogBrowser-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
