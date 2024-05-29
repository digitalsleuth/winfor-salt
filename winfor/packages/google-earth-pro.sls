# Name: Google Earth Pro
# Website: https://www.google.com/earth/about/versions/?gl=CA&hl=en#download-pro
# Description: Tool for viewing Google Maps through installed application
# Category: Utilities
# Author: Google
# License: Terms of Service (https://www.google.com/help/terms_maps/)
# Version: 7.3.4.8642
# Notes:

{% set user = salt['pillar.get']('winfor_user', 'user') %}
{% set current_user = salt['environ.get']('USERNAME') %}
{% set all_users = salt['user.list_users']() %}
{% if user in all_users %}
  {% set home = salt['user.info'](user).home %}
{% else %}
{% set home = "C:\\Users\\" + user %}
{% endif %}

include:
  - winfor.config.user
  - winfor.repos

google-earth-pro:
  pkg.installed

remove-google-earth-icon:
  file.absent:
    - names:
      - 'C:\Users\Public\Public Desktop\Google Earth Pro.lnk'
      - 'C:\Users\Public\Desktop\Google Earth Pro.lnk'
      - '{{ home }}\Desktop\Google Earth Pro.lnk'
    {% if user != current_user %}
      - 'C:\Users\{{ current_user }}\Desktop\Google Earth Pro.lnk'
    {% endif %}
    - require:
      - pkg: google-earth-pro
      - user: user-{{ user }}
