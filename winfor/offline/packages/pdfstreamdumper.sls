# Name: PDFStream Dumper
# Website: http://sandsprite.com/blogs/index.php?uid=7&pid=57
# Description: PDF Analysis tool
# Category: Documents / Editors
# Author: David Zimmer (dzzie)
# License: None
# Version: 0.9.634
# Notes: 

{% set version = '0.9.634' %}
{% set PROGRAM_FILES = "%ProgramFiles%" %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set current_user = salt['environ.get']('USERNAME') %}
{% set all_users = salt['user.list_users']() %}
{% if user in all_users %}
  {% set home = salt['user.info'](user).home %}
{% else %}
{% set home = "C:\\Users\\" + user %}
{% endif %}

pdfstreamdumper-install-offline:
  cmd.run:
    - name: '{{ downloads }}\pdfstreamdumper\PDFStreamDumper-Setup-{{ version }}.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE /DIR="{{ PROGRAM_FILES }}\PDFStreamDumper"'
    - cwd: '{{ downloads }}\pdfstreamdumper'
    - shell: cmd

pdfstreamdumper-icon-remove-offline:
  file.absent:
    - names:
      - '{{ home }}\Desktop\PdfStreamDumper.exe.lnk'
    {% if user != current_user %}
      - 'C:\Users\{{ current_user }}\Desktop\PdfStreamDumper.exe.lnk'
    {% endif %}
    - require:
      - user: user-{{ user }}
      - cmd: pdfstreamdumper-install-offline
    - watch:
      - cmd: pdfstreamdumper-install-offline
