# Name: WinDbg
# Website: https://www.microsoft.com
# Description: Windows Debugger
# Category: Executables
# Author: Microsoft
# License: 
# Version: 1.2202.7001.0
# Notes: To get the download URL, Visit: https://store.rg-adguard.net/ and paste the URL for the tool from the MS Store (easier from web browser)

{% set version = '1.2202.7001.0' %}
{% set hash = 'd96a7a3c10275cf86b564f196124806643118f99b328958bdd3ea7a4f26bb970' %}

windbg-download:
  file.managed:
    - name: 'C:\salt\tempdownload\Microsoft.WinDbg_{{ version }}_neutral__8wekyb3d8bbwe.appx'
    - source: 'http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/978feae8-9dfb-448a-af1a-f85fa96fd5ab?P1=1669822041&P2=404&P3=2&P4=R3onCg9n5BaKL5X7vPxFvsDXewZ%2b3EYA7EK0hz%2fiQZtpaFfz6XiJpWlezSJyBzCnHl%2fVTjjNxeCRgKAWHO3rWA%3d%3d'
    - source_hash: sha256={{ hash }}
    - makedirs: True

windbg-install:
  cmd.run:
    - name: "Add-AppxPackage -Path C:\\salt\\tempdownload\\Microsoft.WinDbg_{{ version }}_neutral__8wekyb3d8bbwe.appx"
    - shell: powershell
