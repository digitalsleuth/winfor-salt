# Name: Google Earth Pro
# Website: https://www.google.com/earth/about/versions/?gl=CA&hl=en#download-pro
# Description: Tool for viewing Google Maps through installed application
# Category: Utilities
# Author: Google
# License: Terms of Service (https://www.google.com/help/terms_maps/)
# Version: 7.3.6.10441
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.3.6.10441' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('google-earth-pro') %}

google-earth-pro-download-only:
  file.managed:
    - name: '{{ downloads }}\google-earth-pro\google-earth-pro-{{ version }}.exe'
    - source: https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-{{ '.'.join(version.split(".")[:3]) }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
