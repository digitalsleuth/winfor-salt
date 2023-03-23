# Name: NTCore Tool Suite
# Website: https://ntcore.com
# Description: Suite of Windows-based analysis tools
# Category: Windows Analysis
# Author: Erik Pistelli
# License: 
# Version: Various
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set files = [
                ('DriverList', 'dbc5736808cf7203cf289a269cc27cbcf90a8c69e03eed60ae361ad29da08d28'),
                ('DynLogger_x64', 'a5e17491696d36f5c9b17f0e73ed33cfb9bf0f14fb035bb40c868ab5b6c0be3c'),
                ('DynLogger_x86', '416e92b91b05ecbcf622476da538785ecfa30910cd42ee1a508361f22a1ccaa5'),
                ('NETUnpack_x64', 'af7f2ca052855d6c1613eb6901897ab9c1ffa4eda17b115e71651fbdcec13852'),
                ('NETUnpack', 'e46bd2ecdd1cc72c011406fa07d239f1ad8d8cd5e6c5e9945d186078c3e24278'),
                ('WIM_Installer', '071e2aa6c57478b53e99d45ca588f8b36f9fc673907b3769884112078f357264')
               ] %}

{% for file, hash in files %}

ntcore-download-only-{{ file }}:
  file.managed:
    - name: {{ downloads }}\{{ file }}.zip
    - source: https://ntcore.com/files/{{ file }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: true

{% endfor %}
