# Name: 4n6 Email Forensics
# Website: https://forensiksoft.com
# Description: Email forensics utility
# Category: Email
# Author: 4n6 Software
# License: https://forensiksoft.com/terms/
# Version: 7.6
# Notes:

include:
  - winfor.repos
  - winfor.packages.ms-vcpp-2010-redist-x86

4n6-email-forensics-wizard:
  pkg.installed:
    - require:
      - sls: winfor.packages.ms-vcpp-2010-redist-x86

taskkill-email-forensics-wizard:
  cmd.run:
    - name: 'taskkill /F /IM "EmailForensicsWizard.exe"'
    - bg: True
    - require:
      - pkg: 4n6-email-forensics-wizard

taskkill-email-forensics-wizard-edge-window:
  cmd.run:
    - name: 'taskkill /F /IM "msedge.exe"'
    - bg: True
    - require:
      - pkg: 4n6-email-forensics-wizard
