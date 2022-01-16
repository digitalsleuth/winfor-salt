{% set version = '0.3.2' %}
{% set hash = 'fc3a6ced08ca2c3390141c05fab8c63901d2727ca31ee64be938f61c053d1ca9' %}

pe-sieve-download:
  file.managed:
    - name: 'C:\standalone\pe-sieve\pe-sieve.exe'
    - source: https://github.com/hasherezade/pe-sieve/releases/download/v{{ version }}/pe-sieve64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

pe-sieve-env-vars:
  win_path.exists:
    - name: 'C:\standalone\pe-sieve\'
