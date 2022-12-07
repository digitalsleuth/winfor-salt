# Name: Nuix Evidence Mover
# Website: https://www.nuix.com/nuix-evidence-mover
# Description: File Transfer tool with source and destination hashing
# Category: Utilities
# Author: NUIX
# License: https://www.oracle.com/legal/terms.html
# Version: 6.2.1
# Notes:

{% set version = '6.2.1' %}
{% set hash = 'C0105268D6366E36034B63422200949EDFCDAFCB235586761B6670C94EC47BF5' %}

nuix-evidence-mover-download:
  file.managed:
    - name: 'C:\salt\tempdownload\Evidence_Mover_{{ version }}.msi.zip'
    - source: "https://www.nuix.com/sites/default/files/downloads/marketo/Evidence%20Mover%20{{ version }}.msi_.zip"
    - source_hash: sha256={{ hash }}
    - makedirs: True

nuix-evidence-mover-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload\'
    - source: 'C:\salt\tempdownload\Evidence_Mover_{{ version }}.msi.zip'
    - enforce_toplevel: False
    - require:
      - file: nuix-evidence-mover-download

nuix-evidence-mover-install:
  cmd.run:
    - name: 'msiexec /i "C:\salt\tempdownload\Evidence Mover {{ version }}.msi" /qn /norestart'
    - shell: cmd
    - require:
      - archive: nuix-evidence-mover-extract

nuix-evidence-mover-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Nuix Evidence Mover.lnk'
    - watch:
      - cmd: nuix-evidence-mover-install
