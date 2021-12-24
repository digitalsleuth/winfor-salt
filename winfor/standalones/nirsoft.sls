{% set version = '1.23.55' %}
{% set hash = '8436e9640a67606f3d97281712647c3ff8250472988adf9c5dade557902252f2' %}

nirsoft:
  file.managed:
    - name: C:\\salt\\tempdownload\\nirsoft_package_enc_{{ version }}.zip
    - source: https://download.nirsoft.net/nirsoft_package_enc_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

nirsoft-extract:
  archive.extracted:
    - name: C:\\standalone\\nirsoft\\
    - source: C:\\salt\\tempdownload\\nirsoft_package_enc_{{ version }}.zip
    - enforce_toplevel: false
    - password: nirsoft9876$
    - watch:
      - file: nirsoft
