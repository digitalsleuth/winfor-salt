# Name: Libre Office
# Website: https://www.libreoffice.org
# Description: Open Source Office Document suite
# Category: Documents / Editors
# Author: LibreOffice
# License: Mozilla Public License (https://www.libreoffice.org/download/license/)
# Version: 25.2.4.1
# Notes: 

{% set version = '25.2.4.1' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed, get_version %}
{% set installed = check_installed('LibreOffice*') | trim == 'true' %}
{% set installed_version = get_version('LibreOffice') | trim %}
{% set pkg = 'libreoffice-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\libreoffice\\' + pkg) %}

{% if not installed %}
{% if exists %}
libreoffice-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /qn /norestart CREATEDESKTOPLINK=0'
    - shell: cmd
    - cwd: '{{ downloads }}\libreoffice\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
{% elif installed_version >= version %}
LibreOffice is at version {{ installed_version }} - not reinstalling:
  test.nop
{% else %}
libreoffice-new-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /qn /norestart CREATEDESKTOPLINK=0'
    - shell: cmd
    - cwd: '{{ downloads }}\libreoffice\'
{% endif %}
