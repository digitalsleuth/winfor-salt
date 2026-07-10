# Name: Innounp
# Website: https://innounp.sourceforge.net
# Description: Unpacker of executables packed by InnoSetup
# Category: Installers
# Author: Ariman_ua, quickener
# License: GNU General Public License v3 (https://innounp.sourceforge.net/#Copyrights)
# Version: 0.50
# Notes: 

{% set version = '0.50' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'innounp-'~ version ~'.rar' %}
{% set exists = salt['file.file_exists'](downloads + '\\innounp\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.7zip
  - winfor.config.shims

innounp-extract-offline:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x {{ downloads }}\innounp\{{ pkg }} -aoa -o{{ inpath }}\innounp'
    - shell: cmd
    - require:
      - sls: winfor.offline.packages.7zip

innounp-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\innounp\innounp.exe -OutPath {{ inpath }}\shims\innounp.exe'
    - require:
      - sls: winfor.config.shims

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
