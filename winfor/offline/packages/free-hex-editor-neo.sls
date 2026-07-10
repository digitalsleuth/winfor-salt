# Name: Hex Editor Neo (Free)
# Website: https://www.hhdsoftware.com
# Description: Hex Editor
# Category: Raw Parsers / Decoders
# Author: HHD Software
# License: EULA (https://www.hhdsoftware.com/company/terms-of-use)
# Version: 8.12.00.9421
# Notes: 

{% set version = '8.12.00.9421' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'free-hex-editor-neo-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\free-hex-editor-neo\\' + pkg) %}

{% if exists %}
free-hex-editor-neo-install-offline:
  cmd.run:
    - name: '{{ pkg }} -silent -machine'
    - shell: cmd
    - cwd: '{{ downloads }}\free-hex-editor-neo\'

free-hex-editor-neo-icon-remove-offline:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Hex Editor Neo.lnk'
    - require:
      - cmd: free-hex-editor-neo-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
