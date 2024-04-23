# Name: HttpLogBrowser
# Website: https://www.finalanalytics.com/products/httplogbrowser
# Description: Web server log analyzer
# Category: Logs
# Author: FinalAnalytics
# License: EULA (https://www.finalanalytics.com/downloads/HttpLogBrowser-EULA.pdf)
# Version: 4.6.3.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '4.6.3.0' %}
{% set hash = 'ee20614d473a5e533a9b7d0b8e488bec9ea5bd97031224f4b8a5e18be84465e1' %}

httplogbrowser-download-only:
  file.managed:
    - name: '{{ downloads }}\httplogbrowser\HttpLogBrowser-Setup-{{ version }}.exe'
    - source: https://www.finalanalytics.com/downloads/HttpLogBrowser-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
