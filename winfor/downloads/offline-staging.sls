# The purpose of this state is to simply stage state files and executables for offline install

{% set version = '1.0.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.downloads.packages.saltstack

winfor-copy-current-states:
  file.copy:
    - name: '{{ downloads }}\offline\winfor'
    - source: 'C:\ProgramData\Salt Project\Salt\srv\salt\winfor'
    - subdir: True
    - makedirs: True
    - replace: True

winfor-copy-saltstack-directory:
  file.copy:
    - name: '{{ downloads }}\offline\Salt'
    - source: 'C:\Program Files\Salt Project\Salt'
    - subdir: True
    - makedirs: True
    - replace: True

winfor-download-offline-installer:
  file.managed:
    - name: '{{ downloads }}\offline\win-for-offline-v{{ version }}.exe'
    - source: https://github.com/digitalsleuth/win-for-offline/releases/download/v{{ version }}/win-for-offline-v{{ version }}.exe
    - skip_verify: True
    - require:
      - file: winfor-copy-current-states
      - file: winfor-copy-saltstack-directory
