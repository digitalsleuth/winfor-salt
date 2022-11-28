4n6-email-forensics-wizard:
  pkg.installed

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
