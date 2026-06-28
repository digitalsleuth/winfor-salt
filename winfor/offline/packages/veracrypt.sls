# Name: Veracrypt
# Website: https://www.veracrypt.fr/code/VeraCrypt/
# Description: Encrypted container creation and management
# Category: Utilities
# Author: https://github.com/veracrypt/VeraCrypt/blob/master/doc/html/Authors.html
# License: Apache License v2 (https://github.com/veracrypt/VeraCrypt/blob/master/License.txt)
# Version: 1.26.29
# Notes: 

{% set version = '1.26.29' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'veracrypt-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\veracrypt\\' + pkg) %}

{% if exists %}
veracrypt-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /qn /norestart ACCEPTLICENSE=YES INSTALLDESKTOPSHORTCUT=""'
    - shell: cmd
    - cwd: '{{ downloads }}\veracrypt\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
