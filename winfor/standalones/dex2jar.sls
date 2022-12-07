# Name: dex2jar
# Website: https://github.com/pxb1988/dex2jar
# Description: Android .dex and .class file analysis
# Category: Mobile Analysis
# Author: Bob Pan (pxb1988)
# License: Apache License v2.0 (https://github.com/pxb1988/dex2jar/blob/2.x/LICENSE.txt)
# Version: 2.1
# Notes: 

include:
  - winfor.installers.jre8

dex2jar-download:
  file.managed:
    - name: 'C:\salt\tempdownload\dex2jar-2.1.zip'
    - source: https://github.com/pxb1988/dex2jar/releases/download/v2.1/dex2jar-2.1.zip
    - source_hash: sha256=7a9bdf843d43de4d1e94ec2e7b6f55825017b0c4a7ee39ff82660e2493a46f08
    - makedirs: True

dex2jar-extract:
  archive.extracted:
    - name: 'C:\standalone\'
    - source: 'C:\salt\tempdownload\dex2jar-2.1.zip'
    - enforce_toplevel: False
    - require:
      - file: dex2jar-download
      - sls: winfor.installers.jre8

dex2jar-folder-rename:
  file.rename:
    - name: 'C:\standalone\dex2jar'
    - source: 'C:\standalone\dex-tools-2.1\'
    - force: True
    - makedirs: True
    - require:
      - archive: dex2jar-extract 

dex2jar-env-vars:
  win_path.exists:
    - names:
      - 'C:\standalone\dex2jar\'
      - 'C:\standalone\dex2jar\bin\'
