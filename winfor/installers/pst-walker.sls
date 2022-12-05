# Name: PST Walker
# Website: https://www.pstwalker.com/
# Description: Forensic GUI Tool for PST, OST
# Category: Email Forensics
# Author: PST Walker
# License: GNU General Public License (GPL) (https://www.pstwalker.com/licensing-policy.html)
# Version: 6.21

{% set hash = '3512DFDC7BEEFEFCA6144FD923CBEE02E35A0A8EE3F9BCB28EE2C47D7C902D30' %}

brim:
  file.managed:
    - name: 'C:\salt\tempdownload\pstwalker621.exe'
    - source: https://downloads.pstwalker.com/pstwalker621.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

pst-walker-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\pstwalker621.exe /SP- /VERYSILENT
    - shell: cmd
    - success_retcodes: 2
