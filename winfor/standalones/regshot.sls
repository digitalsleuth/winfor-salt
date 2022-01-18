{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.7zip

regshot-download:
  file.managed:
    - name: 'C:\salt\tempdownload\Regshot-1.9.0.7z'
    - source: https://phoenixnap.dl.sourceforge.net/project/regshot/regshot/1.9.0/Regshot-1.9.0.7z
    - source_hash: sha256=a92327ffa25f456dff86bae60d42dc8e85e8f3cf987d1d0449d0402a39827d85
    - makedirs: True

regshot-extract:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x C:\salt\tempdownload\Regshot-1.9.0.7z -oC:\standalone\regshot'
    - shell: cmd
    - require:
      - file: regshot-download
      - sls: winfor.packages.7zip

winfor-standalones-regshot-shortcut-1:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Regshot x64 ANSI.lnk'
    - target: 'C:\standalone\regshot\Regshot-x64-ANSI.exe'
    - force: True
    - working_dir: 'C:\standalone\regshot\'
    - makedirs: True
    - require:
      - file: regshot-download
      - cmd: regshot-extract

winfor-standalones-regshot-shortcut-2:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Regshot x64 Unicode.lnk'
    - target: 'C:\standalone\regshot\Regshot-x64-Unicode.exe'
    - force: True
    - working_dir: 'C:\standalone\regshot\'
    - makedirs: True
    - require:
      - file: regshot-download      
      - cmd: regshot-extract            

winfor-standalones-regshot-shortcut-3:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Regshot x86 ANSI.lnk'
    - target: 'C:\standalone\regshot\Regshot-x86-ANSI.exe'
    - force: True
    - working_dir: 'C:\standalone\regshot\'
    - makedirs: True
    - require:
      - file: regshot-download
      - cmd: regshot-extract

winfor-standalones-regshot-shortcut-4:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Regshot x86 Unicode.lnk'
    - target: 'C:\standalone\regshot\Regshot-x86-Unicode.exe'
    - force: True
    - working_dir: 'C:\standalone\regshot\'
    - makedirs: True
    - require:
      - file: regshot-download
      - cmd: regshot-extract
