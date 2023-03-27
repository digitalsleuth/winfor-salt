# Name: CaseNotes Pro
# Website: https://first-response.co.uk/
# Description: Tool to record and track case notes
# Category: Utilities
# Author: First Response
# License: EULA
# Version: 2.17.8.30
# Notes:

{% set user = salt['pillar.get']('cpcwin_user', 'user') %}

include:
  - winfor.config.user
  - winfor.packages.ms-vcpp-2010-redist-x64

casenotes-pro-source:
  file.managed:
    - name: 'C:\salt\tempdownload\cnsetup.msi'
    - source: salt://winfor/files/cnsetup.msi
    - skip_verify: True
    - makedirs: True

casenotes-pro-install:
  cmd.run:
    - name: 'msiexec /i cnsetup.msi /qn /norestart'
    - cwd: 'C:\salt\tempdownload\'
    - require:
      - sls: winfor.packages.ms-vcpp-2010-redist-x64

casenotes-icons-remove:
  file.absent:
    - names:
      - 'C:\Users\{{ user }}\Desktop\CaseNotes Professional.lnk'
      - 'C:\Users\{{ user }}\Desktop\CaseNotes Professional Manual.pdf.lnk'
    - require:
      - cmd: casenotes-pro-install
      - user: winfor-user-{{ user }}
