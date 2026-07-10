# Name: WizTree
# Website: https://diskanalyzer.com/
# Description: Disk Space Analyzer tool
# Category: Utilities
# Author: Antibody Software
# License: EULA (https://diskanalyzer.com/eula)
# Version: 4.31
# Notes:

{% set version = '4.31' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'wiztree-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\wiztree\\' + pkg) %}

{% if exists %}
wiztree-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\wiztree\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
