{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '4ed521a6f727c2a5352b2d28e28cfd8639e9c8cbc1b7a35aa7e003464c4fc139' %}

include:
  - winfor.wsl.wsl2-update
  - winfor.config.user

wsl-config-version:
  cmd.run:
    - name: 'wsl --set-default-version 2'
    - shell: cmd
    - require:
      - sls: winfor.wsl.wsl2-update

{% if salt['file.file_exists']('C:\\salt\\tempdownload\\WIN-FOR-20.04.tar') and salt['file.check_hash']('C:\\salt\\tempdownload\\WIN-FOR-20.04.tar', hash)%}

wsl-template-already-downloaded:
  test.nop

{% else %}

wsl-get-template:
  file.managed:
    - name: 'C:\salt\tempdownload\WIN-FOR-20.04.tar'
    - source: https://sourceforge.net/projects/winfor/files/wsl/WIN-FOR-20.04.tar/download
    - source_hash: sha256={{ hash }}
    - makedirs: True

{% endif %}

wsl-make-install-directory:
  file.directory:
    - name: '{{ inpath }}\wsl\'
    - win_inheritance: True
    - makedirs: True

wsl-import-template:
  cmd.run:
    - name: 'wsl --import WIN-FOR {{ inpath }}\wsl\ C:\salt\tempdownload\WIN-FOR-20.04.tar'
    - shell: cmd
    - require:
      - file: wsl-make-install-directory

wsl-get-sift:
  cmd.run:
    - name: 'wsl echo forensics | wsl sudo -S wget -O /usr/local/bin/sift https://github.com/teamdfir/sift-cli/releases/download/v1.14.0-rc1/sift-cli-linux'
    - shell: cmd
    - require:
      - cmd: wsl-import-template

wsl-chmod-sift:
  cmd.run:
    - name: 'wsl echo forensics | wsl sudo -S chmod +x /usr/local/bin/sift'
    - shell: cmd
    - require:
      - cmd: wsl-get-sift

wsl-run-sift:
  cmd.run:
    - name: 'wsl echo forensics | wsl sudo -S sift install --mode server --user forensics'
    - shell: cmd
    - require:
      - cmd: wsl-chmod-sift

wsl-get-remnux:
  cmd.run:
    - name: 'wsl echo forensics | wsl sudo -S wget -O /usr/local/bin/remnux https://github.com/remnux/remnux-cli/releases/download/v1.3.4/remnux-cli-linux'
    - shell: cmd
    - require:
      - cmd: wsl-run-sift

wsl-chmod-remnux:
  cmd.run:
    - name: 'wsl echo forensics | wsl sudo -S chmod +x /usr/local/bin/remnux'
    - shell: cmd
    - require:
      - cmd: wsl-get-remnux

wsl-fix-salt-python-importlib:
  cmd.run:
    - name: 'wsl echo forensics | wsl sudo -S python3 -m pip install "importlib-metadata<5.0.0"'
    - shell: cmd
    - require:
      - cmd: wsl-chmod-remnux

wsl-run-remnux:
  cmd.run:
    - name: 'wsl echo forensics | wsl sudo -S remnux install --mode addon --user forensics'
    - shell: cmd
    - require:
      - cmd: wsl-chmod-remnux

winfor-wsl-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\WSL.lnk'
    - target: 'C:\Windows\System32\wsl.exe'
    - force: True
    - working_dir: 'C:\Windows\System32\'
    - makedirs: True
    - require:
      - cmd: wsl-config-version
      - file: wsl-make-install-directory
      - cmd: wsl-import-template
