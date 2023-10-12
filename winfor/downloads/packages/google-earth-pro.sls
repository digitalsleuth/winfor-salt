# Name: Google Earth Pro
# Website: https://www.google.com/earth/about/versions/?gl=CA&hl=en#download-pro
# Description: Tool for viewing Google Maps through installed application
# Category: Utilities
# Author: Google
# License: Terms of Service (https://www.google.com/help/terms_maps/)
# Version: 7.3.4.8642
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.3.4.8642' %}
{% set short_version = '7.3.4' %}
{% set hash = '2b1bdcb63b7239505e89ce2632555fa86851a47231a0e85b168245e56c02ba08' %}

google-earth-pro-download-only:
  file.managed:
    - name: '{{ downloads }}\google-earth-pro\googleearthprowin-{{ short_version }}-x64.exe'
    - source: https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-{{ short_version }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
