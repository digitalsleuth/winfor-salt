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
{% set short_version = '7.3.6' %}
{% set hash = 'd8aa6d38d95d92d18601f94b1da092b34f9d275ade630fb972baff8bf1e4ebd8' %}

google-earth-pro-download-only:
  file.managed:
    - name: '{{ downloads }}\google-earth-pro\googleearthprowin-{{ short_version }}-x64.exe'
    - source: https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-{{ short_version }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
