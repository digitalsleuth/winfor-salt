# Name: Firefox
# Website: https://www.mozilla.org/en-US/firefox/new/
# Description: Mozilla web browser
# Category: Browsers
# Author: Mozilla Foundation
# License: Mozilla Public License 2.0 (https://www.mozilla.org/en-US/MPL/)
# Version: 150.0
# Notes: 

{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = '150.0' %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Mozilla Firefox*') | trim == 'true' %}

{% if not installed %}

firefox-x64-offline:
  cmd.run:
    - name: '"Firefox Setup {{ version }}.exe" /S /DESKTOPSHORTCUT=FALSE'
    - cwd: '{{ downloads }}\firefox\'

{% else %}
"Firefox is already installed":
  test.nop
{% endif %}
