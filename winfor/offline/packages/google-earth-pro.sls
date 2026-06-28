# Name: Google Earth Pro
# Website: https://www.google.com/earth/about/versions/?gl=CA&hl=en#download-pro
# Description: Tool for viewing Google Maps through installed application
# Category: Utilities
# Author: Google
# License: Terms of Service (https://www.google.com/help/terms_maps/)
# Version: 7.3.6.10441
# Notes:

{% set version = '7.3.6.10441' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'google-earth-pro-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\google-earth-pro\\' + pkg) %}

{% if exists %}
google-earth-pro-install-offline:
  cmd.run:
    - name: '{{ pkg }} OMAHA=1'
    - shell: cmd
    - cwd: '{{ downloads }}\google-earth-pro\'

google-earth-pro-icon-remove-offline:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Google Earth Pro.lnk'
    - require:
      - cmd: google-earth-pro-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
