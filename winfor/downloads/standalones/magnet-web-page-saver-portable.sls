# Name: WebPageSaver
# Website: https://magnetforensics.com
# Description: Creates an HTML report containing a snapshot of each webpage at a specific point in time
# Category: Network
# Author: Magnet Forensics
# License: EULA
# Version: 3.4.0
# Notes:

{% set version = '3.4.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('magnet-web-page-saver-portable') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

magnet-web-page-saver-download-only:
  file.managed:
    - name: '{{ downloads }}\magnetforensics\magnet-web-page-saver-{{ version }}.zip'
    - source: https://storage.googleapis.com/mfi-files/free_tools/WPS/portable/WebPageSaverV{{ version | replace(".","") }}-Portable.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
