# Name: ilspy
# Website: https://github.com/icsharpcode/ilspy
# Description: .NET Decompiler
# Category: Executables
# Author: ICSharpCode (https://github.com/orgs/icsharpcode/people)
# License: MIT License (https://github.com/icsharpcode/ILSpy/blob/master/doc/ILSpyAboutPage.txt)
# Version: 10.1.0.8386
# Notes:

{% set version = '10.1.0.8386' %}
{% set core_version = '10.1' %}

include:
  - winfor.repos
  - winfor.packages.dotnet10-desktop-runtime

ilspy:
  pkg.installed:
    - require:
      - sls: winfor.packages.dotnet10-desktop-runtime
