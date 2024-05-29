# Name: OSFMount
# Website: https://www.osforensics.com/tools/mount-disk-images.html
# Description: Drive / Disk / Image mounting tool
# Category: Acquisition and Analysis
# Author: PassMark
# License: Free (EULA, contained in software)
# Version: 3.1.1003.0
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

osfmount:
  pkg.installed
  
osfmount-remove-icon:
  file.absent:
    - names:
      - '{{ home }}\Desktop\OSFMount.lnk'
      - 'C:\Users\Public\Desktop\OSFMount.lnk'
    {% if user != current_user %}
      - 'C:\Users\{{ current_user }}\Desktop\OSFMount.lnk'
    {% endif %}
    - require:
      - user: user-{{ user }}
      - pkg: osfmount

osfmount-close-application:
  cmd.run:
    - name: 'taskkill /F /IM "OSFMount.exe"'
    - bg: True
    - require:
      - pkg: osfmount
