#This still needs to account for launching of WSL on first run and creating user/password
# wsl --set-default-version 1
# wsl --import Ubuntu-20.04 <PlaceToInstallTheOS> <TAR-File>
# Will still need to set the hostname
# Create shortcut for wsl --user forensics
# Default version of 1 is set because Ubuntu doesn't seem to want to install without this
# msiexec /i https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi /qn /norestart
# https://github.com/microsoft/WSL/issues/3974 to fix the default user
# Creating the template, adding the /etc/wsl.conf file works to create the default user, now
# need a shortcut.

include:
  - winfor.installers.wsl
  - winfor.packages.wsl2-update

wsl-config-version:
  cmd.run:
    - name: 'wsl --set-default-version 1'
    - shell: cmd
    - require:
      - sls: winfor.installers.wsl
      - sls: winfor.packages.wsl2-update

wsl-update:
  cmd.run:
    - name: 'wsl --update'
    - shell: cmd
    - require:
      - cmd: wsl-config-version

wsl-get-template:
  file.managed:
    - source: 'C:\\salt\\tempdownload\\Ubuntu-20.04.tar'
    - name: https://sourceforge.net/projects/winfor/files/wsl/Ubuntu-20.04.tar/download
    - source_hash: sha256=
    - makedirs: True

wsl-import-template:
  cmd.run:
    - name: 'wsl --import C:\\standalone\\wsl\\ C:\\salt\\tempdowload\\Ubuntu-20.04.tar'
    - shell: cmd
    - watch:
      - file: wsl-get-template
    - require:
      - file: wsl-get-template

wsl-config-version-2:
  cmd.run:
    - name: 'wsl --set-version Ubuntu-20.04 2'
    - shell: cmd

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
