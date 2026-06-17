# Name: ClamAV
# Website: https://www.clamav.net
# Description: Open Source Antivirus
# Category: Utilities
# Author: Cisco / Talos - https://www.clamav.net/about
# License: GNU General Public License v2.0 (https://github.com/Cisco-Talos/clamav/blob/main/COPYING.txt)
# Version: 1.4.4
# Notes:

{% set version = '1.4.4' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed, get_version %}
{% set installed = check_installed('ClamAV') | trim == 'true' %}
{% set installed_version = get_version('ClamAV') | trim %}

{% if not installed or installed_version != version %}

clamav-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ downloads }}\clamav\clamav-{{ version }}.win.x64.msi /qn /norestart'
    - shell: cmd

{% else %}
"ClamAV is already installed":
  test.nop
{% endif %}
