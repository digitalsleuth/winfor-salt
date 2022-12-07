# Name: Magnet AXIOM
# Website: https://www.magnetforensics.com
# Description: Evidence Acquisition and Analysis toolset
# Category: Acquisition and Analysis
# Author: Jad Saliba - Magnet Forensics
# License: EULA
# Version: 6.8.0.33717
# Notes:

{% set dot_version = '6.8.0.33717' %}
{% set file_version = '680.33717' %}
{% set hash = 'f8d6754b2aaffccabfa769866b5b6c621851cb1763abd85e23ef6e7af36f20af' %}

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
