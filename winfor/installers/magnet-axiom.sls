# Name: Magnet AXIOM
# Website: https://www.magnetforensics.com
# Description: Evidence Acquisition and Analysis toolset
# Category: Analysis and Acquisition
# Author: Jad Saliba - Magnet Forensics
# License: EULA
# Version: 6.3.0.32040
# Notes:

{% set dot_version = '6.3.0.32040' %}
{% set file_version = '630.32040' %}
{% set hash = 'FC120E04DA228E4F677B8C5B785B98F3917E893EA0F63A5631531C3918C9C99D' %}

magnet-axiom-download:
  file.managed:
    - name: 'C:\salt\tempdownload\AXIOMv{{ file_version }}setup.zip'
    - source: https://prod-releases.magnetforensics.com/axiom/{{ dot_version }}/installer/AXIOMv{{ file_version }}setup.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

magnet-axiom-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload\AXIOM\'
    - source: 'C:\salt\tempdownload\AXIOMv{{ file_version }}setup.zip'
    - enforce_toplevel: false
    - watch:
      - file: magnet-axiom-download

magnet-axiom-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\AXIOM\AXIOMv{{ file_version }}setup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd

magnet-axiom-cleanup-1:
  file.absent:
    - name: 'C:\salt\tempdownload\AXIOM\'
    - require:
      - cmd: magnet-axiom-install

magnet-axiom-cleanup-2:
  file.absent:
    - name: 'C:\salt\tempdownload\AXIOMv{{ file_version }}setup.zip'
    - require:
      - cmd: magnet-axiom-install
