# Name: Apple iTunes
# Website: https://www.apple.com
# Description: Media viewer and Apple device manager
# Category: Utilities
# Author: Apple
# License: EULA
# Version: 12.13.7.1
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '12.13.7.1' %}
{% set hash = '2f5a7f4a85e24810297cb3ef63fd6d743df1c62edfc5e4ca3677c7b083bc2ff0' %}
{% set url_path = '082-11723-20250331-b31ec27c-f9dd-42b1-9af3-2e2590232c09' %}

itunes-download-only:
  file.managed:
    - name: '{{ downloads }}\itunes\iTunes64Setup-{{ version }}.exe'
    - source: https://secure-appldnld.apple.com/itunes12/{{ url_path }}/iTunes64Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
