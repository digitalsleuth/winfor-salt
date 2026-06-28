# Name: System Informer
# Website: https://systeminformer.com
# Description: Process analysis and dumping tool
# Category: Executables
# Author: Steven G (dmex) / Wen Jia Liu / WinSiderss
# License: MIT License (https://github.com/winsiderss/systeminformer/blob/master/LICENSE.txt)
# Version: 3.2.25011.2103
# Notes: Formerly process hacker

{% set version = '3.2.25011.2103' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'systeminformer-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\systeminformer\\' + pkg) %}

{% if exists %}
systeminformer-install-offline:
  cmd.run:
    - name: '{{ pkg }} -install -silent'
    - shell: cmd
    - cwd: '{{ downloads }}\systeminformer\'

taskkill-systeminformer-window-offline:
  cmd.run:
    - name: 'taskkill /F /IM "SystemInformer.exe"'
    - bg: True
    - watch:
      - cmd: systeminformer-install-offline

systeminformer-icon-remove-offline:
  file.absent:
    - name: 'C:\Users\Public\Desktop\System Informer.lnk'
    - require:
      - cmd: systeminformer-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}

