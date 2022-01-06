{% set version = '0.7.2' %}
{% set hash = 'b5c44f9837a80085bd2a6816ddb87c9815ba0c92cfb4590fa8b6ca525aa96c0b' %}

evtx-dump:
  file.managed:
    - name: 'C:\standalone\evtx-dump\evtx_dump.exe'
    - source: https://github.com/omerbenamram/evtx/releases/download/v{{ version }}/evtx_dump-v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True

evtx-dump-env-vars:
  win_path.exists:
    - name: 'C:\standalone\evtx-dump\'
