# Name: ilspy
# Website: https://github.com/icsharpcode/ilspy
# Description: .NET Decompiler
# Category: Executables
# Author: ICSharpCode (https://github.com/orgs/icsharpcode/people)
# License: MIT License (https://github.com/icsharpcode/ILSpy/blob/master/doc/ILSpyAboutPage.txt)
# Version: 9.1.0.7988
# Notes:

{% set version = '9.1.0.7988' %}
{% set core_version = '9.1' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'b35f8fb2729829389ad31e753afcf8f60fad6e1ad689e1df28c61cc2c193ca4e' %}

ilspy-download-only:
  file.managed:
    - name: '{{ downloads }}\ilspy\ILSpy_Installer_{{ version }}-x64.msi'
    - source: https://github.com/icsharpcode/ILSpy/releases/download/v{{ core_version }}/ILSpy_Installer_{{ version }}-x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
