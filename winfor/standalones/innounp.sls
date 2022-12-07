# Name: Innounp
# Website: https://innounp.sourceforge.net
# Description: Unpacker of executables packed by InnoSetup
# Category: Installers
# Author: Ariman_ua, quickener
# License: GNU General Public License v3 (https://innounp.sourceforge.net/#Copyrights)
# Version: 0.50
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.7zip

innounp-download:
  file.managed:
    - name: 'C:\salt\tempdownload\innounp050.rar'
    - source: 'https://versaweb.dl.sourceforge.net/project/innounp/innounp/innounp%200.50/innounp050.rar'
    - source_hash: sha256=1d8837540ccc15d98245a1c73fd08f404b2a7bdfe7dc9bed2fdece818ff6df67
    - makedirs: True

innounp-extract:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x C:\salt\tempdownload\innounp050.rar -aoa -oC:\standalone\innounp'
    - shell: cmd
    - require:
      - file: innounp-download
      - sls: winfor.packages.7zip

innounp-env-vars:
  win_path.exists:
    - name: 'C:\standalone\innounp\'

