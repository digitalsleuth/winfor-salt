# Name: ImportExcel
# Website: https://github.com/dfinke/ImportExcel
# Description: Powershell Module for working with Excel documents
# Category: Utilities
# Author: Doug Finke
# License: Apache License v2.0 (https://github.com/dfinke/ImportExcel/blob/master/LICENSE.txt)
# Version: 7.8.6
# Notes: Installed directly from PSGallery

{% set version = '7.8.6' %}

include:
  - winfor.packages.nuget

install-importexcel:
  cmd.run:
    - name: 'Install-Module -Name ImportExcel -Scope AllUsers -Repository PSGallery -Force'
    - shell: powershell
    - require:
      - sls: winfor.packages.nuget
