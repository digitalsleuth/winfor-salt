# Name: OSFMount
# Website: https://www.osforensics.com/tools/mount-disk-images.html
# Description: Drive / Disk / Image mounting tool
# Category: Acquisition and Analysis
# Author: PassMark
# License: Free (EULA, contained in software)
# Version: 3.1
# Notes: 

{% set version = '3.1.1003.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'osfmount-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\osfmount\\' + pkg) %}
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set current_user = salt['environ.get']('USERNAME') %}
{% set all_users = salt['user.list_users']() %}
{% if user in all_users %}
  {% set home = salt['user.info'](user).home %}
{% else %}
{% set home = "C:\\Users\\" + user %}
{% endif %}

{% if exists %}

include:
  - winfor.config.user

osfmount-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\osfmount\'

osfmount-remove-icon-offline:
  file.absent:
    - names:
      - '{{ home }}\Desktop\OSFMount.lnk'
      - 'C:\Users\Public\Desktop\OSFMount.lnk'
    {% if user != current_user %}
      - 'C:\Users\{{ current_user }}\Desktop\OSFMount.lnk'
    {% endif %}
    - require:
      - user: user-{{ user }}
      - cmd: osfmount-install-offline

osfmount-close-application-offline:
  cmd.run:
    - name: 'taskkill /F /IM "OSFMount.exe"'
    - bg: True
    - require:
      - cmd: osfmount-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
