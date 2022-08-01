# Name: Java Runtime Environment
# Website: https://www.java.com
# Description: Java Engine
# Category: Requirements
# Author: Oracle
# License: https://www.oracle.com/legal/terms.html
# Notes: 
# Version: 8u311

jre8-download:
  file.managed:
    - name: 'C:\salt\tempdownload\jre-8u311-windows-x64.exe'
    - source: 'https://javadl.oracle.com/webapps/download/AutoDL?BundleId=245479_4d5417147a92418ea8b615e228bb6935'
    - source_hash: sha256=4885e64c3e5dd16dc49f9b81c502e39c7529c6741776951c6702ab0af5ac44c0
    - makedirs: True

jre8-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\jre-8u311-windows-x64.exe /s REBOOT=Suppress SPONSORS=0 REMOVEOUTOFDATEJRES=1 AUTO_UPDATE=Disable'
    - shell: cmd
