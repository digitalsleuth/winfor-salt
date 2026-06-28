# Name: Adobe Reader DC Classic
# Website: https://www.adobe.com
# Description: Adobe PDF Document Reader
# Category: Requirements
# Author: Adobe
# License: https://helpx.adobe.com/ca/reader/acrobat-copyright-trademarks-third-party-notices.html
# Version: 24.002.20759
# Notes: 

{% set version = '24.002.20759' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'adobe-reader-'~ version ~'.exe' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set exists = salt['file.file_exists'](downloads + '\\adobe-reader\\' + pkg) %}

{% if exists %}
adobereader-offline:
  cmd.run:
    - name: '{{ pkg }} /msi EULA_ACCEPT=YES ALLUSERS=1 REMOVE_PREVIOUS=YES DISABLEDESKTOPSHORTCUT=1 /qn'
    - shell: cmd
    - cwd: '{{ downloads }}\adobe-reader'
{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
