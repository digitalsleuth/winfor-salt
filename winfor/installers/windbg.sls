# To get the download URL:
# Visit: https://store.rg-adguard.net/
# Paste the URL for the tool from the MS Store (easier from web browser)

{% set version = '1.2111.9001.0' %}
{% set hash = '14a0abf4ab28280841100baf6d71b75dea023a036bbb250222e51c155c5696fd' %}

windbg-download:
  file.managed:
    - name: 'C:\salt\tempdownload\Microsoft.WinDbg_{{ version }}_neutral__8wekyb3d8bbwe.appx'
    - source: 'http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/91c570bb-a9bf-413e-8b1f-d723721b101a?P1=1642122705&P2=404&P3=2&P4=SNHXqz84BGaImCd%2f4UPq5PYYYgxbE43IV%2bJuvJaAlKi4D6f3vA8c8uQp5enyXl5T%2fz3U9p%2bHWHiItWS3W0yLAg%3d%3d'
    - source_hash: sha256={{ hash }}
    - makedirs: True

windbg-install:
  cmd.run:
    - name: "Add-AppxPackage -Path C:\\salt\\tempdownload\\Microsoft.WinDbg_{{ version }}_neutral__8wekyb3d8bbwe.appx"
    - shell: powershell
