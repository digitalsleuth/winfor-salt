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
{% set pkg = 'clamav-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\clamav\\' + pkg) %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed, get_version %}
{% set installed = check_installed('ClamAV') | trim == 'true' %}
{% set installed_version = get_version('ClamAV') | trim %}

{% if not installed or installed_version != version %}
{% if exists %}
clamav-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /qn /norestart'
    - cwd: '{{ downloads }}\clamav'
    - shell: cmd
{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}

{% else %}
"ClamAV is already installed":
  test.nop
{% endif %}

