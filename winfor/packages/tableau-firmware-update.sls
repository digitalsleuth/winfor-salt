# Name: Tableau Firmware Update
# Website: https://www.opentext.com
# Description: Firmware update utility for Tableau forensic devices
# Category: Utilities
# Author: OpenText
# License: EULA
# Version: 24.3.3
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
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

tableau-certificate-copy:
  file.managed:
    - name: 'C:\salt\tempdownload\tableau.cer'
    - source: salt://winfor/files/tableau.cer
    - makedirs: True

tableau-certificate-install:
  certutil.add_store:
    - name: 'C:\salt\tempdownload\tableau.cer'
    - store: TrustedPublisher
    - require:
      - file: tableau-certificate-copy

tableau-firmware-update:
  pkg.installed:
    - require:
      - certutil: tableau-certificate-install

tableau-firmware-update-icon-del:
  file.absent:
    - names:
      - '{{ home }}\Desktop\Tableau Firmware Update.lnk'
      - 'C:\Users\Public\Desktop\Tableau Firmware Update.lnk'
    {% if user != current_user %}
      - 'C:\Users\{{ current_user }}\Desktop\Tableau Firmware Update.lnk'
    {% endif %}
    - require:
      - certutil: tableau-certificate-install
      - pkg: tableau-firmware-update
      - user: user-{{ user }}

tableau-firmware-update-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Tableau Firmware Update.lnk'
    - target: 'C:\Program Files (x86)\Tableau\Tableau Firmware Update\tabup.exe'
    - force: True
    - working_dir: 'C:\Program Files (x86)\Tableau\Tableau Firmware Update\'
    - require:
      - pkg: tableau-firmware-update
