# Name: Passware Encryption Analyzer
# Website: https://www.passware.com
# Description: Encryption Analysis tool
# Category: Raw Parsers / Decoders
# Author: Passware - Dmitry Sumin
# License: EULA - https://www.passware.com/files/Passware-EULA.pdf
# Version: 2025.1.0.4433
# Notes:

{% set version = '2025.1.0.4433' %}

include:
  - winfor.repos

Check for previous Passware versions and remove:
  pkg.removed:
    - name: passware-encryption-analyzer
    - onlyif:
      - fun: cmd.run
        cmd: $installedVersion = (C:\Program` Files\Salt` Project\Salt\salt-call.exe --local pkg.version passware-encryption-analyzer); if ($installedVersion -isnot [Array]) {exit 12345} else {exit 0}
        shell: powershell
        python_shell: True

saltutil.clear_cache:
  module.run

passware-encryption-analyzer:
  pkg.installed:
    - version: {{ version }}
    - require:
      - pkg: Check for previous Passware versions and remove
