# The debloat scripts in use are originally sourced from
# https://github.com/Jawabiscuit/Win10-Initial-Setup-Script 
# and have been modified for use in this toolset 
# Modifications can be found in this repo and at
# https://github.com/digitalsleuth/Win10-Initial-Setup-Script

transfer-debloat-script:
  file.managed:
    - name: 'C:\Windows\System32\WindowsPowerShell\v1.0\Modules\Win10Debloat\Win10.ps1'
    - source: salt://winfor/config/Win10.ps1
    - makedirs: True
    - win_inheritance: True

transfer-debloat-module:
  file.managed:
    - name: 'C:\Windows\System32\WindowsPowerShell\v1.0\Modules\Win10Debloat\Win10.psm1'
    - source: salt://winfor/config/Win10.psm1
    - makedirs: True
    - win_inheritance: True

transfer-debloat-preset:
  file.managed:
    - name: 'C:\Windows\System32\WindowsPowerShell\v1.0\Modules\Win10Debloat\debloat.preset'
    - source: salt://winfor/config/debloat.preset
    - makedirs: True
    - win_inheritance: True

debloat-windows:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File "Win10.ps1" -include "Win10.psm1" -preset "debloat.preset"'
    - cwd: 'C:\Windows\System32\WindowsPowerShell\v1.0\Modules\Win10Debloat\'
    - shell: powershell
