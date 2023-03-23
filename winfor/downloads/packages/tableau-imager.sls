# Name: Tableau Imager
# Website: https://opentext.com
# Description: Disk / Device Imager
# Category: Acquisition and Analysis
# Author: OpenText
# License: EULA
# Version: 20.3.3
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '20.3' %}
{% set hash = 'c4dbffc9737ba012925db7181738c7747e69ec853520acb0f70c95f17394ff1d' %}

tableau-imager-download-only:
  file.managed:
    - name: '{{ downloads }}\setup_tableau_imager_{{ version }}.msi'
    - source: https://mimage.opentext.com/support/ecm/tableau/setup_tableau_imager_{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
