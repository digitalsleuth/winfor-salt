# Name: VSCode (Visual Studio Code)
# Website: https://code.visualstudio.com/
# Description: Open Source Code Editor and Debugger
# Category: Documents / Editors
# Author: Microsoft
# License: Code - MIT License (https://github.com/microsoft/vscode/blob/main/LICENSE.txt) / Product (https://code.visualstudio.com/License/)
# Version: 1.73.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.73.1' %}
{% set guid = '6261075646f055b99068d3688932416f2346dd3b' %}
{% set hash = '47746bb858382632e699d5766c9cfec4029357748420de70136f08a515d8298a' %}

vscode-download-only:
  file.managed:
    - name: '{{ downloads }}\VSCodeSetup-x64-{{ version }}.exe'
    - source: https://az764295.vo.msecnd.net/stable/{{ guid }}/VSCodeSetup-x64-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
