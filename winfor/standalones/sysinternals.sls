sysinternals:
  file.managed:
    - name: "C:\\salt\\tempdownload\\SysinternalsSuite.zip"
    - source: "https://download.sysinternals.com/files/SysinternalsSuite.zip"
    - source_hash: sha256=70c573589fbea5cc7d8f0b4c75e9d4172f932c21ff9368512eb5215e05c97ebb
    - makedirs: True

sysinternals-extract:
  archive.extracted:
    - name: "C:\\standalone\\sysinternals\\"
    - source: "C:\\salt\\tempdownload\\SysinternalsSuite.zip"
    - enforce_toplevel: false
    - watch:
      - file: sysinternals
