# The New-Shim script will create shims for executables instead of relying
# on the win_path.exists module for each to ensure they are available
# at the command line

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

create-shims-directory:
  file.directory:
    - name: '{{ inpath }}\shims\'
    - win_inheritance: True
    - makedirs: True

copy-shim-file:
  file.managed:
    - source: salt://winfor/files/New-Shim.ps1
    - name: '{{ inpath }}\New-Shim.ps1'
    - skip_verify: True
    - require:
      - file: create-shims-directory

shim-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\shims\'
    - require:
      - file: create-shims-directory
      - file: copy-shim-file
