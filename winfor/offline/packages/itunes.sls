# Name: Apple iTunes
# Website: https://www.apple.com
# Description: Media viewer and Apple device manager
# Category: Utilities
# Author: Apple
# License: EULA
# Version: 12.12.10.1
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '12.12.10.1' %}
{% set hash = '31465167704b2fd795aafc14cf5c04261d7c3ae663d087f63842e431aa204abc' %}

itunes-download-only:
  file.managed:
    - name: '{{ downloads }}\itunes\iTunes64Setup-{{ version }}.exe'
    - source: https://secure-appldnld.apple.com/itunes12/042-32480-20230911-CC326CC1-E6C1-4F7C-A717-18493F59FE2E/iTunes64Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
