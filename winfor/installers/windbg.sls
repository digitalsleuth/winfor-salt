# Name: WinDbg
# Website: https://www.microsoft.com
# Description: Windows Debugger
# Category: Executables
# Author: Microsoft
# License: Third-party Notices within app
# Version: 1.2202.7001.0
# Notes: To get the download URL, Visit: https://store.rg-adguard.net/ and paste the URL for the tool from the MS Store (easier from web browser)

{% set version = '1.2202.7001.0' %}
{% set hash = 'd96a7a3c10275cf86b564f196124806643118f99b328958bdd3ea7a4f26bb970' %}
{% set url_vars = 'P1=1674500669&P2=404&P3=2&P4=da70JoLS8dolGr63AzWvUIW6ihrdH3qhXkxml%2f8MOKQCSEXmz5u0rtyHavNhmetuh%2fv1vxxDGxQ%2fdpWIt3KMWA%3d%3d' %}

windbg-download:
  file.managed:
    - name: 'C:\salt\tempdownload\Microsoft.WinDbg_{{ version }}_neutral__8wekyb3d8bbwe.appx'
    - source: 'http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/978feae8-9dfb-448a-af1a-f85fa96fd5ab?{{ url_vars }}'
    - source_hash: sha256={{ hash }}
    - makedirs: True

windbg-install:
  cmd.run:
    - name: "dism /Online /Add-ProvisionedAppxPackage /PackagePath:Microsoft.WinDbg_{{ version }}_neutral__8wekyb3d8bbwe.appx /SkipLicense"
    - shell: cmd
    - cwd: 'C:\salt\tempdownload\'
    - require:
      - windbg-download
