evtx_dump:
  file.managed:
    - name: C:\\standalone\\evtx_dump.exe
    - source: https://github.com/omerbenamram/evtx/releases/download/v0.7.2/evtx_dump-v0.7.2.exe
    - source_hash: sha256=b5c44f9837a80085bd2a6816ddb87c9815ba0c92cfb4590fa8b6ca525aa96c0b
    - makedirs: True
    - replace: True
