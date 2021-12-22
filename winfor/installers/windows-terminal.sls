{% set version='1.11.3471.0' %}

windows-terminal:
  file.managed:
    - name: C:\\salt\\tempdownload\\Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle
    - source: https://github.com/microsoft/terminal/releases/download/v1.11.3471.0/Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle
    - source_hash: sha256=8d4aa2585e62cdd5a1c8c3c5ed4f482f5029eace4777d247a3c728538f126f6a
    - makedirs: True

windows-terminal-install:
  cmd.run:
    - name: "Add-AppxPackage -Path C:\\salt\\tempdownload\\Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle"
    - shell: powershell
