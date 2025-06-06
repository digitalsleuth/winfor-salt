# Name: Google Earth Pro
# Website: https://www.google.com/earth/about/versions/?gl=CA&hl=en#download-pro
# Description: Tool for viewing Google Maps through installed application
# Category: Utilities
# Author: Google
# License: Terms of Service (https://www.google.com/help/terms_maps/)
# Version: 7.3.6.9345
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.3.6.9345' %}
{% set short_version = '7.3.6' %}
{% set hash = '663d2e45bdf7df41d3d9a355a99c121d10a3830a23fc66bc554f1c532f6e2238' %}

google-earth-pro-download-only:
  file.managed:
    - name: '{{ downloads }}\google-earth-pro\googleearthprowin-{{ short_version }}-x64.exe'
    - source: https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-{{ short_version }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
