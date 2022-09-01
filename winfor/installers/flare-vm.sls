# Name: flare-vm
# Website: https://github.com/mandiant/flare-vm
# Description: MANDIANT FLARE VM installer
# Category: N/A
# Author: MANDIANT
# License: Apache License 2.0 (https://github.com/mandiant/flare-vm/blob/master/LICENSE.txt)
# Notes: 
# Version: 3.0.1

{% set version = '3.0.1' %}
{% set hash = '0228be803b7fee439e07db5bed557d5232e0350981cf8cbf6369b315c9c2c06b' %}
flare-vm:
  file.managed:
    - name: C:\\salt\\tempdownload\\install.ps1
    - source: https://github.com/digitalsleuth/flare-vm/raw/master/install.ps1
    - source_hash: sha256={{ hash }}
    - makedirs: True

flare-vm-install:
  cmd.run:
    - name: "powershell.exe -ep bypass C:\\salt\\tempdownload\\install.ps1 -norestart -password forensics -ignore_space"
    - shell: powershell
