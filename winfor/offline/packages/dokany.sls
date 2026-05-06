# Name: Dokany
# Website: https://github.com/dokan-dev/dokany
# Description: User mode file system library for Windows
# Category: Utilities
# Author: Liryna
# License: GNU Lesser General Public License v3.0 / MIT (https://github.com/dokan-dev/dokany/blob/master/license.mit.txt / https://github.com/dokan-dev/dokany/blob/master/license.lgpl.txt)
# Version: 2.3.1.1000
# Notes:

{% set version = '2.3.1.1000' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed, get_version %}
{% set installed = check_installed('Dokan Library') | trim == 'true' %}
{% set installed_version = get_version('Dokan Library') | trim %}
{% if installed and installed_version | length > 0 and installed_version != version %}

Dokany {{ installed_version }} must be removed before {{ version }} can be installed, and the new version MUST be installed after a reboot. Not proceeding with dokany install in offline mode:
  test.nop

{% elif installed and installed_version | length > 0 and installed_version == version %}

Dokany {{ version }} (offline) is already installed:
  test.nop

{% else %}

dokany-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ downloads }}\dokany\Dokan_x64-{{ version }}.msi /qn /norestart'
    - shell: cmd

{% endif %}
