# Name: NTCore Tool Suite
# Website: https://ntcore.com
# Description: Suite of Windows-based analysis tools
# Category: Windows Analysis
# Author: Erik Pistelli
# License: 
# Version: Various
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set files = ['DriverList','DynLogger_x64','DynLogger_x86','NETUnpack_x64','NETUnpack','WIM_Installer'] %}
{% set exes = [('DriverList', 'DriverList_x64'),
               ('DriverList', 'DriverList_x86'),
               ('DynLogger_x64', 'DynLogger'),
               ('WIM_Installer', 'WIM Installer')
              ] %}

{% for file in files %}

ntcore-extract-{{ file }}-offline:
  archive.extracted:
    - name: '{{ inpath }}\ntcore\{{ file }}'
    - source: '{{ downloads }}\ntcore\{{ file }}.zip'
    - enforce_toplevel: false

{% endfor %}

{% for folder, exe in exes %}

ntcore-{{ exe }}-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\{{ exe }}.lnk'
    - target: '{{ inpath }}\ntcore\{{ folder }}\{{ exe }}.exe'
    - force: True
    - working_dir: '{{ inpath }}\ntcore\{{ folder }}\'
    - makedirs: True

{% endfor %}

ntcore-netunpack-x64-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\NETUnpack-x64.lnk'
    - target: '{{ inpath }}\ntcore\NETUnpack_x64\NETUnpack.exe'
    - force: True
    - working_dir: '{{ inpath }}\ntcore\NETUnpack_x64\'
    - makedirs: True

ntcore-netunpack-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\NETUnpack.lnk'
    - target: '{{ inpath }}\ntcore\NETUnpack\NETUnpack.exe'
    - force: True
    - working_dir: '{{ inpath }}\ntcore\NETUnpack\'
    - makedirs: True

ntcore-dynlogger-x64-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\DynLogger-x64.lnk'
    - target: '{{ inpath }}\ntcore\DynLogger_x64\DynLogger.exe'
    - force: True
    - working_dir: '{{ inpath }}\ntcore\DynLogger_x64\'
    - makedirs: True

ntcore-dynlogger-x86-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\DynLogger-x86.lnk'
    - target: '{{ inpath }}\ntcore\DynLogger_x86\DynLogger.exe'
    - force: True
    - working_dir: '{{ inpath }}\ntcore\DynLogger_x86\'
    - makedirs: True
