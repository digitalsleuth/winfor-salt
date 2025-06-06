# Name: dotPeek
# Website: https://www.jetbrains.com
# Description: .NET Decompiler and Assembly Browser
# Category: Executables
# Author: JetBrains
# License: EULA (https://www.jetbrains.com/legal/docs/toolbox/license_personal/)
# Version: 2025.1.2
# Notes: 

{% set version = '2025.1.2' %}

include:
  - winfor.repos

dotpeek:
  pkg.installed:
    - version: '2025.1.2'
