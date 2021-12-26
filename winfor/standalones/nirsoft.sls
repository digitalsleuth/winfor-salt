{% set version = '1.23.55' %}
{% set hash = '8436e9640a67606f3d97281712647c3ff8250472988adf9c5dade557902252f2' %}

include:
  - winfor.packages.7zip

nirsoft:
  cmd.run:
    - name: 'wget -O C:\\salt\\tempdownload\\nirsoft_package_enc_{{ version }}.zip -Headers @{"Referer"="https://launcher.nirsoft.net/downloads/index.html"} https://download.nirsoft.net/nirsoft_package_enc_{{ version }}.zip'
    - shell: powershell

nirsoft-extract:
  archive.extracted:
    - name: C:\\standalone\\nirsoft\\
    - source: C:\\salt\\tempdownload\\nirsoft_package_enc_{{ version }}.zip
    - enforce_toplevel: false
    - password: nirsoft9876$
    - watch:
      - cmd: nirsoft
    - require:
      - sls: winfor.packages.7zip
