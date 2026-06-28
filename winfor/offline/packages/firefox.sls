# Name: Firefox
# Website: https://www.mozilla.org/en-US/firefox/new/
# Description: Mozilla web browser
# Category: Browsers
# Author: Mozilla Foundation
# License: Mozilla Public License 2.0 (https://www.mozilla.org/en-US/MPL/)
# Version: 150.0
# Notes: 

{% set version = '150.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'firefox-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\firefox\\' + pkg) %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Mozilla Firefox*') | trim == 'true' %}

{% if not installed %}
{% if exists %}

firefox-install-offline:
  cmd.run:
    - name: '"{{ pkg }}" /S /DESKTOPSHORTCUT=FALSE'
    - shell: cmd
    - cwd: '{{ downloads }}\firefox\'

{% else %}

{{ pkg }} does not exist - not installing:
  test.nop

{% endif %}

{% else %}

Firefox is already installed:
  test.nop

{% endif %}
