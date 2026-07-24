{% set wsl_choice = salt['pillar.get']('wsl_choice', 'both') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set PROGRAM_FILES = salt['environ.get']('PROGRAMFILES') %}
{% set START_MENU = PROGRAMDATA + '\Microsoft\Windows\Start Menu\Programs' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set castver = '1.0.23' %}
{% set wslver = '2.7.10.0' %}
{% set distro = 'LIN-FOR-24' %}
{% set wsl_cmd = 'wsl -d ' + distro %}
{% set user_pass = "forensics:forensics" %}

include:
  - winfor.config.shims

wsl-update-command:
  cmd.run:
    - name: 'wsl --update'
    - shell: cmd

wsl-config-version:
  cmd.run:
    - name: 'wsl --set-default-version 2'
    - shell: cmd
    - require:
      - cmd: wsl-update-command

wsl-make-install-directory:
  file.directory:
    - name: '{{ inpath }}\lin-for\'
    - win_inheritance: True
    - makedirs: True
    - unless:
      - fun: file.file_exists
        path: '{{ inpath }}\lin-for\ext4.vhdx'

wsl-install-distro:
  cmd.run:
    - name: 'wsl --install Ubuntu-24.04 --name {{ distro }} --location {{ inpath }}\lin-for -n --web-download'
    - shell: cmd
    - require:
      - cmd: wsl-config-version
      - cmd: wsl-update-command
      - file: wsl-make-install-directory
    - unless:
      - fun: file.file_exists
        path: '{{ inpath }}\lin-for\ext4.vhdx'

wsl-apt-update-upgrade:
  cmd.run:
    - name: '{{ wsl_cmd }} bash -c "DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -y && apt-get install wget gnupg git openssh-server nano xrdp -y"'
    - shell: cmd
    - require:
      - cmd: wsl-install-distro

wsl-create-group:
  cmd.run:
    - name: '{{ wsl_cmd }} DEBIAN_FRONTEND=noninteractive groupadd -r -g 1000 forensics'
    - shell: cmd
    - unless: '{{ wsl_cmd }} getent group forensics'
    - require:
      - cmd: wsl-install-distro
      - cmd: wsl-apt-update-upgrade

wsl-create-user:
  cmd.run:
    - name: '{{ wsl_cmd }} useradd -m -g forensics -d /home/forensics -s /bin/bash -c "Forensics User" -u 1000 forensics'
    - shell: cmd
    - unless: '{{ wsl_cmd }} id forensics'
    - require:
      - cmd: wsl-install-distro
      - cmd: wsl-create-group

wsl-add-user-to-sudoers:
  cmd.run:
    - name: '{{ wsl_cmd }} usermod -aG sudo forensics'
    - shell: cmd
    - unless: '{{ wsl_cmd }} bash -c "passwd -S forensics | grep -qw P"'
    - require:
      - cmd: wsl-install-distro
      - cmd: wsl-create-user

wsl-add-user-password:
  cmd.run:
    - name: {{ wsl_cmd }} bash -c "echo '{{ user_pass }}' | chpasswd"
    - shell: cmd
    - require:
      - cmd: wsl-install-distro
      - cmd: wsl-add-user-to-sudoers

wsl-download-cast:
  cmd.run:
    - name: '{{ wsl_cmd }} wget -O /cast-v{{ castver }}.deb https://github.com/ekristen/cast/releases/download/v{{ castver }}/cast-v{{ castver }}-linux-amd64.deb'
    - shell: cmd
    - require:
      - cmd: wsl-install-distro
      - cmd: wsl-add-user-password

wsl-install-cast:
  cmd.run:
    - name: '{{ wsl_cmd }} dpkg -i /cast-v{{ castver }}.deb'
    - shell: cmd
    - require:
      - cmd: wsl-install-distro
      - cmd: wsl-download-cast

wsl-remove-cast-binary:
  cmd.run:
    - name: '{{ wsl_cmd }} rm /cast-v{{ castver }}.deb'
    - shell: cmd
    - require:
      - cmd: wsl-install-distro
      - cmd: wsl-install-cast

{% if wsl_choice == 'sift' or wsl_choice == 'both' %}

wsl-cast-install-sift:
  cmd.run:
    - name: '{{ wsl_cmd }} bash -c "cast install --mode server --user forensics sift || true"'
    - shell: cmd
    - require:
      - cmd: wsl-install-distro
      - cmd: wsl-remove-cast-binary

wsl-copy-cast-sift-results:
  cmd.run:
    - name: '{{ wsl_cmd }} cp /var/cache/cast/installer/logs/saltstack.log /home/forensics/sift-saltstack.log'
    - shell: cmd
    - require:
      - cmd: wsl-install-distro

{% endif %}

{% if wsl_choice == 'remnux' or wsl_choice == 'both' %}

wsl-cast-install-remnux:
  cmd.run:
    - name: '{{ wsl_cmd }} bash -c "cast install --mode cloud --user forensics remnux || true"'
    - shell: cmd
    - require:
      - cmd: wsl-install-distro

wsl-copy-cast-remnux-results:
  cmd.run:
    - name: '{{ wsl_cmd }} cp /var/cache/cast/installer/logs/saltstack.log /home/forensics/remnux-saltstack.log'
    - shell: cmd
    - require:
      - cmd: wsl-install-distro

wsl-cleanup-remnux:
  cmd.run:
    - name: '{{ wsl_cmd }} bash -c "rm -rf /usr/local/src/remnux/files/*"'
    - shell: cmd
    - require:
      - cmd: wsl-install-distro
      - cmd: wsl-cast-install-remnux

{% endif %}

wsl-create-new-mount-directories:
  cmd.run:
    - name: '{{ wsl_cmd }} bash -c "cd /mnt && mkdir aff bde e01 ewf ewf_mount iscsi shadow_mount usb vss windows_mount"'
    - shell: cmd
    - require:
      - cmd: wsl-install-distro

wsl-create-mount-sub-directories:
  cmd.run:
    - name: '{{ wsl_cmd }} bash -c "mkdir /mnt/windows_mount{1..5} && mkdir /mnt/shadow_mount/vss{1..30}"'
    - shell: cmd
    - require:
      - cmd: wsl-install-distro
      - cmd: wsl-create-new-mount-directories

wsl-cleanup:
  cmd.run:
    - name: '{{ wsl_cmd }} bash -c "rm -rf /var/cache/salt/* && rm -rf /srv/* && rm -rf /root/.cache/* && rm -rf /var/cache/cast/*"'
    - shell: cmd
    - require:
      - cmd: wsl-install-distro

wsl-set-default-user:
  cmd.run:
    - name: 'wsl --manage {{ distro }} --set-default-user forensics'
    - shell: cmd
    - require:
      - cmd: wsl-install-distro

wsl-shutdown:
  cmd.run:
    - name: 'wsl --shutdown'
    - shell: cmd
    - require:
      - cmd: wsl-cleanup

wsl-create-diskpart-script:
  file.managed:
    - name: '{{ inpath }}\lin-for\diskpart-compact.txt'
    - contents: |
        select vdisk file="{{ inpath }}\lin-for\ext4.vhdx"
        attach vdisk readonly
        compact vdisk
        detach vdisk
        exit
    - makedirs: True
    - force: True

wsl-diskpart-compact:
  cmd.run:
    - name: 'diskpart /s {{ inpath }}\lin-for\diskpart-compact.txt'
    - shell: cmd
    - require:
      - file: wsl-create-diskpart-script
      - cmd: wsl-shutdown

wsl-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe "{{ PROGRAM_FILES }}\WindowsApps\MicrosoftCorporationII.WindowsSubsystemForLinux_{{ wslver }}_x64__8wekyb3d8bbwe\wsl.exe" -OutPath {{ inpath }}\shims\wsl.exe'
    - shell: cmd
    - onlyif:
      - fun: file.directory_exists
        path: '{{ PROGRAM_FILES }}\WindowsApps\MicrosoftCorporationII.WindowsSubsystemForLinux_{{ wslver }}_x64__8wekyb3d8bbwe\'
    - require:
      - sls: winfor.config.shims

wsl-shortcut:
  file.shortcut:
    - name: '{{ START_MENU }}\LIN-FOR.lnk'
    - target: '{{ inpath }}\shims\wsl.exe'
    - force: True
    - working_dir: '{{ inpath }}\shims'
    - icon_location: '{{ inpath }}\shims\wsl.exe'
    - arguments: '~'
    - makedirs: True
    - require:
      - cmd: wsl-shim

wsl-portals-shortcut:
  file.copy:
    - name: '{{ inpath }}\Portals\Terminals\'
    - source: '{{ START_MENU }}\LIN-FOR.lnk'
    - preserve: True
    - subdir: True
    - makedirs: True
    - require:
      - cmd: wsl-shim
