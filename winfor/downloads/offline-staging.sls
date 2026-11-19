# The purpose of this state is to simply stage state files and executables for offline install

# renovate: datasource=github-releases depName=digitalsleuth/Win-FOR
{% set version = '13.0.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('offline-staging') %}

winfor-copy-current-states:
  cmd.run:
    - name: 'robocopy "C:\ProgramData\Salt Project\Salt\srv\salt\winfor" "{{ downloads }}\offline\winfor" /E /XJ /R:1 /W:1 /NFL /NDL /NJH /NP'
    - shell: cmd
    - success_retcodes: [1, 2, 3, 4, 5, 6, 7]

winfor-copy-saltstack-directory:
  cmd.run:
    - name: 'robocopy "C:\Program Files\Salt Project\Salt" "{{ downloads }}\offline\Salt" /E /XJ /R:1 /W:1 /NFL /NDL /NJH /NP'
    - shell: cmd
    - success_retcodes: [1, 2, 3, 4, 5, 6, 7]

winfor-download-offline-installer:
  file.managed:
    - name: '{{ downloads }}\offline\winfor-{{ version }}.exe'
    - source: https://github.com/digitalsleuth/win-for/releases/download/v{{ version }}/winfor-v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - cmd: winfor-copy-current-states
      - cmd: winfor-copy-saltstack-directory
