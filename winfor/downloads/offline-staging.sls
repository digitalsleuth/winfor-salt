# The purpose of this state is to simply stage state files and executables for offline install

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
