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

msiviewer-extract-certificate-offline:
  cmd.run:
    - name: powershell.exe -NonInteractive -Command "(Get-AuthenticodeSignature '{{ downloads }}\msiviewer\MSIViewer_{{ version }}_Sideload.msixbundle').SignerCertificate | Export-Certificate -Type CERT -FilePath '{{ downloads }}\msiviewer\msiviewer.cer' | Out-Null"
    - cwd: '{{ downloads }}\msiviewer'

msiviewer-import-certificate-offline:
  certutil.add_store:
    - name: '{{ downloads }}\msiviewer\msiviewer.cer'
    - store: Root

msiviewer-install-offline:
  cmd.run:
    - name: 'Add-AppPackage -Path MSIViewer_{{ version }}_Sideload.msixbundle'
    - cwd: '{{ downloads }}\msiviewer'
    - shell: powershell
