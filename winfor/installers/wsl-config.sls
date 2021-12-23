# Needs shortcut
{% set hash = '4ed521a6f727c2a5352b2d28e28cfd8639e9c8cbc1b7a35aa7e003464c4fc139' %}

include:
  - winfor.installers.wsl
  - winfor.packages.wsl2-update

wsl-update:
  cmd.run:
    - name: 'wsl --update'
    - shell: cmd
    - require:
      - sls: winfor.packages.wsl2-update

wsl-config-version:
  cmd.run:
    - name: 'wsl --set-default-version 2'
    - shell: cmd
    - require:
      - sls: winfor.installers.wsl
      - sls: winfor.packages.wsl2-update

wsl-get-template:
  file.managed:
    - name: 'C:\\salt\\tempdownload\\WIN-FOR-20.04.tar'
    - source: https://sourceforge.net/projects/winfor/files/wsl/WIN-FOR-20.04.tar/download
    - source_hash: sha256={{ hash }}
    - makedirs: True

wsl-import-template:
  cmd.run:
    - name: 'wsl --import C:\\standalone\\wsl\\ C:\\salt\\tempdownload\\WIN-FOR-20.04.tar'
    - shell: cmd
    - watch:
      - file: wsl-get-template
    - require:
      - file: wsl-get-template

wsl-get-sift:
  cmd.run:
    - name: 'wsl echo forensics | wsl sudo -S wget -O /usr/local/bin/sift https://github.com/teamdfir/sift-cli/releases/download/v1.13.1/sift-cli-linux'
    - shell: cmd
    - require:
      - cmd: wsl-config-version

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
    - name: 'wsl echo forensics | wsl sudo -S wget -O /usr/local/bin/remnux https://github.com/remnux/remnux-cli/releases/download/v1.3.3/remnux-cli-linux'
    - shell: cmd
    - require:
      - cmd: wsl-config-version

wsl-chmod-remnux:
  cmd.run:
    - name: 'wsl echo forensics | wsl sudo -S chmod +x /usr/local/bin/remnux'
    - shell: cmd
    - require:
      - cmd: wsl-get-remnux

wsl-run-remnux:
  cmd.run:
    - name: 'wsl echo forensics | wsl sudo -S remnux install --mode addon --user forensics'
    - shell: cmd
    - require:
      - cmd: wsl-chmod-remnux
