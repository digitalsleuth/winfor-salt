# Name: PDFStream Dumper
# Website: https://github.com/dzzie/pdfstreamdumper
# Description: PDF Analysis tool
# Category: Documents / Editors
# Author: David Zimmer (dzzie)
# License: None
# Version: 0.9.624
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

pdfstreamdumper:
  pkg.installed

pdfstreamdumper-icon-remove:
  file.absent:
    - names:
      - '{{ home }}\Desktop\PdfStreamDumper.exe.lnk'
    {% if user != current_user %}
      - 'C:\Users\{{ current_user }}\Desktop\PdfStreamDumper.exe.lnk'
    {% endif %}
    - require:
      - user: user-{{ user }}
      - pkg: pdfstreamdumper
