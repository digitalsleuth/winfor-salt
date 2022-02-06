# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

# Requires Windows Graphviz
# http://www.graphviz.org/pub/graphviz/stable/windows/graphviz-2.28.0.msi
# and Windump/TCPdump
# http://www.winpcap.org/windump/install/bin/windump_3_9_5/WinDump.exe
# Zip password is procdot. This state will not be enabled until SaltStack issue
# https://github.com/saltstack/salt/issues/61422 is resolved

procdot-download:
  file.managed:
    - name: 'C:\salt\tempdownload\procdot_1_22_57_windows.zip'
    - source: https://www.procdot.com/download/procdot/binaries/procdot_1_22_57_windows.zip
    - source_hash: sha256=927cd36dbb4dc0be94afb6021ca7f747dd3f17aad383583bc71aa6e36a762849
    - makedirs: True

procdot-extract:
  archive.extracted:
    - name: 'C:\standalone\procdot'
    - source: 'C:\salt\tempdownload\procdot_1_22_57_windows.zip'
    - enforce_toplevel: False
    - password: procdot
    - require:
      - file: procdot-download
