# Name: MSI Viewer
# Website: https://github.com/wjk/MSIExtractApp
# Description: Tool for viewing and extracting MSI installers
# Category: Installers
# Author: William Kent
# License: MIT (https://github.com/wjk/MSIExtractApp/blob/main/LICENSE)
# Version: 3.1.2
# Notes:

{% set version = '3.1.2' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set PROGRAM_FILES = salt['environ.get']('PROGRAMFILES') %}
{% set pkg = 'msiviewer-'~ version ~'.msixbundle' %}
{% set exists = salt['file.file_exists'](downloads + '\\msiviewer\\' + pkg) %}

{% if exists %}

msiviewer-extract-certificate-offline:
  cmd.run:
    - name: powershell.exe -NonInteractive -Command "(Get-AuthenticodeSignature '{{ downloads }}\msiviewer\{{ pkg }}').SignerCertificate | Export-Certificate -Type CERT -FilePath '{{ downloads }}\msiviewer\msiviewer.cer' | Out-Null"
    - cwd: '{{ downloads }}\msiviewer'

msiviewer-import-certificate-offline:
  certutil.add_store:
    - name: '{{ downloads }}\msiviewer\msiviewer.cer'
    - store: Root

msiviewer-install-offline:
  cmd.run:
    - name: 'Add-AppPackage -Path {{ pkg }}'
    - cwd: '{{ downloads }}\msiviewer'
    - shell: powershell

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
