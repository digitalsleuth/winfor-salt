# Name: Telerik Fiddler
# Website: https://www.telerik.com
# Description: Web debugging proxy tool
# Category: Network
# Author: Telerik
# License: 
# Version: 5.0.20242.10753
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set APPDATA = salt['environ.get']('APPDATA') %}
{% set SHORTCUT1 = 'Microsoft\Windows\Start Menu\Programs\Fiddler Classic.lnk' %}
{% set SHORTCUT2 = 'Microsoft\Windows\Start Menu\Programs\Fiddler ScriptEditor.lnk' %}

fiddler:
  pkg.installed

fiddler-shortcut-1:
  file.managed:
    - name: '{{ PROGRAMDATA }}\{{ SHORTCUT1 }}'
    - source: '{{ APPDATA }}\{{ SHORTCUT1 }}'
    - require:
      - pkg: fiddler

fiddler-shortcut-2:
  file.managed:
    - name: '{{ PROGRAMDATA }}\{{ SHORTCUT2 }}'
    - source: '{{ APPDATA }}\{{ SHORTCUT2 }}'
    - require:
      - pkg: fiddler
