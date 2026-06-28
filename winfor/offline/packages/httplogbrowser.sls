# Name: HttpLogBrowser
# Website: https://www.finalanalytics.com/products/httplogbrowser
# Description: Web server log analyzer
# Category: Logs
# Author: FinalAnalytics
# License: EULA (https://www.finalanalytics.com/downloads/HttpLogBrowser-EULA.pdf)
# Version: 4.6.3.0
# Notes: 

{% set version = '4.6.3.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'httplogbrowser-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\httplogbrowser\\' + pkg) %}

{% if exists %}
httplogbrowser-install-offline:
  cmd.run:
    - name: '{{ pkg }} /qn /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\httplogbrowser\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
