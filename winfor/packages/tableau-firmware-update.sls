# Name: Tableau Firmware Update
# Website: https://www.opentext.com
# Description: Firmware update utility for Tableau forensic devices
# Category: Utilities
# Author: OpenText
# License: EULA
# Version: 24.3.3
# Notes: 

{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
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

tableau-firmware-update:
  pkg.installed

tableau-firmware-update-icon-del:
  file.absent:
    - names:
      - '{{ home }}\Desktop\Tableau Firmware Update.lnk'
      - 'C:\Users\Public\Desktop\Tableau Firmware Update.lnk'
    {% if user != current_user %}
      - 'C:\Users\{{ current_user }}\Desktop\Tableau Firmware Update.lnk'
    {% endif %}
    - require:
      - pkg: tableau-firmware-update
      - user: user-{{ user }}
