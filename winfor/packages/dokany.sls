# Name: Dokany
# Website: https://github.com/dokan-dev/dokany
# Description: User mode file system library for Windows
# Category: Utilities
# Author: Liryna
# License: GNU Lesser General Public License v3.0 / MIT (https://github.com/dokan-dev/dokany/blob/master/license.mit.txt / https://github.com/dokan-dev/dokany/blob/master/license.lgpl.txt)
# Version: 2.3.0.1000
# Notes:

{% set version = '2.3.0.1000' %}
{% set old = '2.0.6.1000' %}
{% set installed = salt['cmd.run']('powershell -c "(Get-ItemProperty HKLM:\\Software\Microsoft\\Windows\\CurrentVersion\\Uninstall\\* | Where-Object {$_.DisplayName -clike \'Dokan*\' } | Select-Object -ExpandProperty DisplayVersion)"') %}

include:
  - winfor.repos

{% if installed and installed != version %}
Dokany {{ installed }} must be removed before {{ version }} can be installed, and the new version MUST be installed after a reboot. Not proceeding with dokany install.:
  test.nop

{% else %}

dokany:
  pkg.installed

{% endif %}
