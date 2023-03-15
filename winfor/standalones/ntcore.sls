# Name: NTCore Tool Suite
# Website: https://ntcore.com
# Description: Suite of Windows-based analysis tools
# Category: Windows Analysis
# Author: Erik Pistelli
# License: 
# Version: Various
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set files = [
                ('DriverList', 'dbc5736808cf7203cf289a269cc27cbcf90a8c69e03eed60ae361ad29da08d28'),
                ('DynLogger_x64', 'a5e17491696d36f5c9b17f0e73ed33cfb9bf0f14fb035bb40c868ab5b6c0be3c'),
                ('DynLogger_x86', '416e92b91b05ecbcf622476da538785ecfa30910cd42ee1a508361f22a1ccaa5'),
                ('NETUnpack_x64', 'af7f2ca052855d6c1613eb6901897ab9c1ffa4eda17b115e71651fbdcec13852'),
                ('NETUnpack', 'e46bd2ecdd1cc72c011406fa07d239f1ad8d8cd5e6c5e9945d186078c3e24278'),
                ('WIM_Installer', '071e2aa6c57478b53e99d45ca588f8b36f9fc673907b3769884112078f357264')
               ] %}
{% set exes = [('DriverList', 'DriverList_x64'),
               ('DriverList', 'DriverList_x86'),
               ('DynLogger_x64', 'DynLogger'),
               ('WIM_Installer', 'WIM Installer')
              ] %}

{% for file, hash in files %}

ntcore-download-{{ file }}:
  file.managed:
    - name: C:\salt\tempdownload\{{ file }}.zip
    - source: https://ntcore.com/files/{{ file }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: true

ntcore-unzip-{{ file }}:
  archive.extracted:
    - name: {{ inpath }}\ntcore\{{ file }}
    - source: C:\salt\tempdownload\{{ file }}.zip
    - enforce_toplevel: false
    - require:
      - file: ntcore-download-{{ file }}

{% endfor %}

{% for folder, exe in exes %}

standalones-ntcore-{{ exe }}-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\{{ exe }}.lnk'
    - target: '{{ inpath }}\ntcore\{{ folder }}\{{ exe }}.exe'
    - force: True
    - working_dir: '{{ inpath }}\ntcore\{{ folder }}\'
    - makedirs: True

{% endfor %}

standalones-ntcore-netunpack-x64-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\NETUnpack-x64.lnk'
    - target: '{{ inpath }}\ntcore\NETUnpack_x64\NETUnpack.exe'
    - force: True
    - working_dir: '{{ inpath }}\ntcore\NETUnpack_x64\'
    - makedirs: True

standalones-ntcore-netunpack-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\NETUnpack.lnk'
    - target: '{{ inpath }}\ntcore\NETUnpack\NETUnpack.exe'
    - force: True
    - working_dir: '{{ inpath }}\ntcore\NETUnpack\'
    - makedirs: True

standalones-ntcore-dynlogger-x64-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\DynLogger-x64.lnk'
    - target: '{{ inpath }}\ntcore\DynLogger_x64\DynLogger.exe'
    - force: True
    - working_dir: '{{ inpath }}\ntcore\DynLogger_x64\'
    - makedirs: True

standalones-ntcore-dynlogger-x86-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\DynLogger-x86.lnk'
    - target: '{{ inpath }}\ntcore\DynLogger_x86\DynLogger.exe'
    - force: True
    - working_dir: '{{ inpath }}\ntcore\DynLogger_x86\'
    - makedirs: True
