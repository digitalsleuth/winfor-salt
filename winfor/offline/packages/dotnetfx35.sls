# Name: .NET 3.5 Framework
# Website: https://download.visualstudio.microsoft.com/download/pr/b635098a-2d1d-4142-bef6-d237545123cb/2651b87007440a15209cac29634a4e45/dotnetfx35.exe
# Description: Microsoft .NET 3.5 Framework with .NET 2.0
# Category: Requirements
# Author: Microsoft
# License: 
# Version: .NET 3.5 SP1
# Notes: 

{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
.NET 3.5 Framework with .NET 2.0 must be installed manually. See the {{ downloads }}\dotnet35 folder for the installer.:
  test.nop

