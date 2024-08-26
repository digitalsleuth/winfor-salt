# Name: Adobe Reader DC Classic
# Website: https://www.adobe.com
# Description: Adobe PDF Document Reader
# Category: Requirements
# Author: Adobe
# License: https://helpx.adobe.com/ca/reader/acrobat-copyright-trademarks-third-party-notices.html
# Version: 24.002.20749
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

adobereader:
  pkg.installed

adobe-icon:
  file.absent:
    - names:
      - '{{ home }}\Desktop\Acrobat Reader.lnk'
      - 'C:\Users\Public\Desktop\Acrobat Reader.lnk'
    {% if user != current_user %}
      - 'C:\Users\{{ current_user }}\Desktop\Acrobat Reader.lnk'
    {% endif %}
    - require:
      - user: user-{{ user }}
      - pkg: adobereader
