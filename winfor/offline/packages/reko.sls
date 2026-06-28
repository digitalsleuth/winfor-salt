# Name: Reko
# Website: https://github.com/uxmal/reko
# Description: Binary decompiler
# Category: Executables
# Author: uxmal et al (https://github.com/uxmal/reko/blob/master/AUTHORS)
# License: GNU General Public License 2.0 (https://github.com/uxmal/reko/blob/master/COPYING)
# Version: 0.12.3
# Notes:

{% set version = '0.12.3' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'reko-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\reko\\' + pkg) %}

{% if exists %}
include:
  - winfor.offline.packages.dotnet8-desktop-runtime

reko-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /qn /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\reko\'
    - require:
      - sls: winfor.offline.packages.dotnet8-desktop-runtime

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
