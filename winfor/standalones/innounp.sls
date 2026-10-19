# Name: Innounp
# Website: https://innounp.sourceforge.net
# Description: Unpacker of executables packed by InnoSetup
# Category: Installers
# Author: Ariman_ua, quickener
# License: GNU General Public License v3 (https://innounp.sourceforge.net/#Copyrights)
# Version: 0.50
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('innounp') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.7zip
  - winfor.config.shims

innounp-download:
  file.managed:
    - name: 'C:\salt\tempdownload\innounp050.rar'
    - source: 'https://downloads.sourceforge.net/project/innounp/innounp/innounp%200.50/innounp050.rar'
    - source_hash: sha256={{ hash }}
    - makedirs: True

innounp-extract:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x C:\salt\tempdownload\innounp050.rar -aoa -o{{ inpath }}\innounp'
    - shell: cmd
    - require:
      - file: innounp-download
      - sls: winfor.packages.7zip

innounp-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\innounp\innounp.exe -OutPath {{ inpath }}\shims\innounp.exe'
    - require:
      - sls: winfor.config.shims

