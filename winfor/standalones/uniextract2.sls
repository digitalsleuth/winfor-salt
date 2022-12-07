# Name: UniExtract2
# Website: https://github.com/Bioruebe/UniExtract2
# Description: Tool to extract files from installers
# Category: Installers
# Author: William Engelmann
# License: GNU General Public License v2 (https://github.com/Bioruebe/UniExtract2/blob/master/LICENSE)
# Version: 2.0.0-rc3
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

uniextract2-download:
  file.managed:
    - name: 'C:\salt\tempdownload\UniExtractRC3.zip'
    - source: https://github.com/Bioruebe/UniExtract2/releases/download/v2.0.0-rc.3/UniExtractRC3.zip
    - source_hash: sha256=03170680b80f2afdf824f4d700c11b8e2dac805a4d9bd3d24f53e43bd7131c3a
    - makedirs: True

uniextract2-extract:
  archive.extracted:
    - name: 'C:\standalone\'
    - source: 'C:\salt\tempdownload\UniExtractRC3.zip'
    - enforce_toplevel: False
    - require:
      - file: uniextract2-download

winfor-standalones-uniextract2-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\UniExtract.lnk'
    - target: 'C:\standalone\uniextract\uniextract.exe'
    - force: True
    - working_dir: 'C:\standalone\uniextract\'
    - makedirs: True
    - require:
      - file: uniextract2-download
      - archive: uniextract2-extract
