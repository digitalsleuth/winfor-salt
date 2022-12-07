# Name: UnAutoIt
# Website: https://github.com/digitalsleuth/UnAutoIt
# Description: AutoIt extractor
# Category: Installers
# Author: Corey Forman (digitalsleuth) / x0r19x91
# License: GNU General Public License v3 (https://github.com/digitalsleuth/UnAutoIt/blob/main/LICENSE)
# Version: 1.1.1
# Notes: 

unautoit-download:
  file.managed:
    - name: 'C:\standalone\unautoit\unautoit.exe'
    - source: https://github.com/digitalsleuth/UnAutoIt/releases/download/v1.1.1/UnAutoIt-windows-amd64.exe
    - source_hash: sha256=d771f7adc7882cf23a387434fbd0ab1902c0326df6035b2a239ebcbd256b52e9
    - makedirs: True

unautoit-env-vars:
  win_path.exists:
    - name: 'C:\standalone\unautoit\'
    - require:
      - file: unautoit-download
