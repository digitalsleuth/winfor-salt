{% set hash = '30636e722be838e8fc5c93e6dd29f2a3ebf7e88c775aa70b96fc4c6f48ac64d5' %}
{% set version = '4.11.1' %}

sleuthkit-download:
  file.managed:
    - name: C:\\salt\\tempdownload\\sleuthkit-{{ version }}-win32.zip
    - source: https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-{{ version }}/sleuthkit-{{ version }}-win32.zip
    - source_hash: {{ hash }}
    - makedirs: True

sleuthkit-extract:
  archive.extracted:
    - name: C:\\standalone\\sleuthkit\\
    - source: C:\\salt\\tempdownload\\sleuthkit-{{ version }}-win32.zip
    - enforce_toplevel: False
    - watch:
      - file: sleuthkit-download
