{% set version = '1.2' %}
{% set hash = '7b52d5b84310bfaec1f9cfb739e7b1c8731af1eb73d9ed4cfeb31bb7118ad2b0' %}
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set home = salt['user.info'](user).home %}

include:
  - winfor.config.user

winfor-standalones-usb-write-blocker:
  file.managed:
    - name: C:\\standalone\USB-Write-Blocker_v{{ version }}.exe
    - source: https://github.com/digitalsleuth/Registry-Write-Block/releases/download/{{ version }}/USB-Registry-Write-Block-PS3x64-v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

#winfor-standalones-usb-write-blocker-shortcut:
#  file.shortcut:
#    - name: {{ home }}\\Desktop\\USB Write Blocker.lnk
#    - target: '"C:\\standalone\\USB-Write-Blocker_v1.2.exe"'
#    - force: True
#    - working_dir: C:\\standalone\\
#    - makedirs: True
#    - require:
#      - file: winfor-standalones-usb-write-blocker
#      - user: winfor-user-{{ user }}

