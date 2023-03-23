# Name: .NET 3.5 Framework
# Website: https://download.visualstudio.microsoft.com/download/pr/b635098a-2d1d-4142-bef6-d237545123cb/2651b87007440a15209cac29634a4e45/dotnetfx35.exe
# Description: Microsoft .NET 3.5 Framework with .NET 2.0
# Category: Requirements
# Author: Microsoft
# License: 
# Version: .NET 3.5 SP1
# Notes: 

{% set hash = '3887bb41eda48915268a9431041eb9f6dde06e52e411b49074b6ac60411b9ebe' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

dotnetfx35-download-only:
  file.managed:
    - name: '{{ downloads }}\dotnetfx35.exe'
    - source: https://go.microsoft.com/fwlink/?linkid=2186537
    - source_hash: sha256={{ hash }}
    - makedirs: True
