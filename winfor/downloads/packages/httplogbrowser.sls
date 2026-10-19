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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('httplogbrowser') %}

httplogbrowser-download-only:
  file.managed:
    - name: '{{ downloads }}\httplogbrowser\httplogbrowser-{{ version }}.exe'
    - source: https://www.finalanalytics.com/downloads/HttpLogBrowser-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
