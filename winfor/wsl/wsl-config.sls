{% set wsl_choice = salt['pillar.get']('wsl_choice', 'siftrem') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set PROGRAM_FILES = salt['environ.get']('PROGRAMFILES') %}
{% set START_MENU = PROGRAMDATA ~ '\\Microsoft\\Windows\\Start Menu' %}
{% set START_PROGRAMS = START_MENU ~ '\\Programs' %}
{% set APPDATA = salt['environ.get']('APPDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\\standalone') %}
{% set castver = '1.0.23' %}
{% set user_pass = "forensics:forensics" %}
{% set non_kali = wsl_choice in ('sift', 'siftrem', 'remnux', 'all') %}
{% from 'winfor/_macros/wsl_functions.jinja' import wsl_install, wsl_apt_update, wsl_bootstrap_user, wsl_diskpart_compact %}


{% if non_kali %}
  {% if wsl_choice in ('sift', 'siftrem', 'remnux') %}
    {% set distro = wsl_choice.upper() ~ '-24' %}
    {% set folder = wsl_choice %}
  {% else %}
    {% set distro = 'SIFTREM-24' %}
    {% set folder = 'siftrem' %}
  {% endif %}
{% set wsl_cmd = 'wsl -d ' ~ distro %}
{% set shortcut_name = distro ~ '.lnk' %}

{{ wsl_install(
    'wsl-make-install-directory',
    'wsl-install-distro',
    inpath ~ '\\wsl\\' ~ folder,
    'wsl --install Ubuntu-24.04 --name ' ~ distro ~ ' --location ' ~ inpath ~ '\\wsl\\' ~ folder ~ ' -n',
    inpath ~ '\\wsl\\' ~ folder ~ '\\ext4.vhdx'
) }}

{{ wsl_apt_update('wsl-apt-update-upgrade', wsl_cmd, 'wsl-install-distro') }}

{{ wsl_bootstrap_user(
    'wsl-bootstrap-user-forensics',
    wsl_cmd, 'wsl-install-distro', 'wsl-apt-update-upgrade', user_pass
) }}

wsl-download-cast:
  cmd.run:
    - name: '{{ wsl_cmd }} wget -O /cast-v{{ castver }}.deb https://github.com/ekristen/cast/releases/download/v{{ castver }}/cast-v{{ castver }}-linux-amd64.deb'
    - shell: cmd
    - unless: '{{ wsl_cmd }} command -v cast'
    - require:
      - cmd: wsl-install-distro
      - cmd: wsl-bootstrap-user-forensics

wsl-install-cast:
  cmd.run:
    - name: '{{ wsl_cmd }} dpkg -i /cast-v{{ castver }}.deb'
    - shell: cmd
    - unless: '{{ wsl_cmd }} command -v cast'
    - require:
      - cmd: wsl-download-cast

wsl-remove-cast-binary:
  cmd.run:
    - name: '{{ wsl_cmd }} rm /cast-v{{ castver }}.deb'
    - shell: cmd
    - onlyif: '{{ wsl_cmd }} test -f /cast-v{{ castver }}.deb'
    - require:
      - cmd: wsl-install-cast

{% if wsl_choice in ('sift', 'siftrem', 'all') %}
wsl-cast-install-sift:
  cmd.run:
    - name: '{{ wsl_cmd }} bash -c "cast install --mode server --user forensics sift || true"'
    - shell: cmd
    - creates: '\\\\wsl.localhost\\{{ distro }}\\home\\forensics\\sift-saltstack.log'
    - require:
      - cmd: wsl-remove-cast-binary

wsl-copy-cast-sift-results:
  cmd.run:
    - name: '{{ wsl_cmd }} cp /var/cache/cast/installer/logs/saltstack.log /home/forensics/sift-saltstack.log'
    - shell: cmd
    - creates: '\\\\wsl.localhost\\{{ distro }}\\home\\forensics\\sift-saltstack.log'
    - require:
      - cmd: wsl-cast-install-sift
{% endif %}

{% if wsl_choice in ('remnux', 'siftrem', 'all') %}
wsl-cast-install-remnux:
  cmd.run:
    - name: '{{ wsl_cmd }} bash -c "cast install --mode cloud --user forensics remnux || true"'
    - shell: cmd
    - creates: '\\\\wsl.localhost\\{{ distro }}\\home\\forensics\\remnux-saltstack.log'
    - require:
      - cmd: wsl-remove-cast-binary

wsl-copy-cast-remnux-results:
  cmd.run:
    - name: '{{ wsl_cmd }} cp /var/cache/cast/installer/logs/saltstack.log /home/forensics/remnux-saltstack.log'
    - shell: cmd
    - creates: '\\\\wsl.localhost\\{{ distro }}\\home\\forensics\\remnux-saltstack.log'
    - require:
      - cmd: wsl-cast-install-remnux

wsl-cleanup-remnux:
  cmd.run:
    - name: '{{ wsl_cmd }} bash -c "rm -rf /usr/local/src/remnux/files/*"'
    - shell: cmd
    - require:
      - cmd: wsl-cast-install-remnux
{% endif %}

wsl-setup-mounts-and-cleanup:
  cmd.run:
    - name: |
        {{ wsl_cmd }} bash -c "mkdir -p /mnt/{aff,bde,e01,ewf,ewf_mount,iscsi,shadow_mount,usb,vss,windows_mount} && mkdir -p /mnt/windows_mount{1..5} /mnt/shadow_mount/vss{1..30} && rm -rf /var/cache/salt/* /srv/* /root/.cache/* /var/cache/cast/*"
    - shell: cmd
    - require:
      - cmd: wsl-install-distro

wsl-set-default-user:
  cmd.run:
    - name: 'wsl --manage {{ distro }} --set-default-user forensics'
    - shell: cmd
    - require:
      - cmd: wsl-bootstrap-user-forensics

wsl-shutdown:
  cmd.run:
    - name: 'wsl --shutdown'
    - shell: cmd
    - require:
      - cmd: wsl-set-default-user
      - cmd: wsl-setup-mounts-and-cleanup

{{ wsl_diskpart_compact(
    'wsl-create-diskpart-script', 'wsl-diskpart-compact',
    inpath ~ '\\wsl\\' ~ folder ~ '\\ext4.vhdx', inpath ~ '\\wsl\\' ~ folder ~ '\\diskpart-compact.txt',
    'wsl-shutdown'
) }}


wsl-shortcut-{{ distro }}:
  file.copy:
    - name: '{{ START_PROGRAMS }}\{{ shortcut_name }}'
    - source: '{{ APPDATA }}\Microsoft\Windows\Start Menu\{{ shortcut_name }}'
    - force: True
    - onlyif:
      - fun: file.file_exists
        path: '{{ APPDATA }}\Microsoft\Windows\Start Menu\{{ shortcut_name }}'

wsl-portals-shortcut-{{ distro }}:
  file.copy:
    - name: '{{ inpath }}\Portals\Terminals\{{ shortcut_name }}'
    - source: '{{ START_PROGRAMS }}\{{ shortcut_name }}'
    - force: True
    - onlyif:
      - fun: file.file_exists
        path: '{{ START_PROGRAMS }}\{{ shortcut_name }}'

wsl-non-kali-sync:
  test.nop:
    - require:
      - file: wsl-portals-shortcut-{{ distro }}
      - cmd: wsl-diskpart-compact
      - file: wsl-shortcut-{{ distro }}

{% endif %}

{% if wsl_choice in ('kali', 'all') %}
{% set kali_cmd = 'wsl -d kali-linux' %}

{{ wsl_install(
    'wsl-make-kali-install-directory',
    'wsl-install-kali',
    inpath ~ '\\wsl\\kali',
    'wsl --install kali-linux --location ' ~ inpath ~ '\\wsl\\kali -n',
    inpath ~ '\\wsl\\kali\\ext4.vhdx',
    extra_require='- test: wsl-non-kali-sync' if non_kali else ''
) }}

{{ wsl_apt_update('wsl-apt-update-upgrade-kali', kali_cmd, 'wsl-install-kali') }}

{{ wsl_bootstrap_user(
    'wsl-bootstrap-user-kali',
    kali_cmd, 'wsl-install-kali', 'wsl-apt-update-upgrade-kali', user_pass
) }}

wsl-install-kali-pkgs:
  cmd.run:
    - name: '{{ kali_cmd }} DEBIAN_FRONTEND=noninteractive apt install kali-linux-large kali-win-kex -y'
    - shell: cmd
    - require:
      - cmd: wsl-bootstrap-user-kali

wsl-set-default-user-kali:
  cmd.run:
    - name: 'wsl --manage kali-linux --set-default-user forensics'
    - shell: cmd
    - require:
      - cmd: wsl-install-kali-pkgs

wsl-shutdown-kali:
  cmd.run:
    - name: 'wsl --shutdown'
    - shell: cmd
    - require:
      - cmd: wsl-set-default-user-kali

{{ wsl_diskpart_compact(
    'wsl-create-diskpart-script-kali', 'wsl-diskpart-compact-kali',
    inpath ~ '\\wsl\\kali\\ext4.vhdx', inpath ~ '\\wsl\\kali\\diskpart-compact.txt',
    'wsl-shutdown-kali'
) }}

wsl-shortcut-kali:
  file.copy:
    - name: '{{ START_PROGRAMS }}\kali-linux.lnk'
    - source: '{{ APPDATA }}\Microsoft\Windows\Start Menu\kali-linux.lnk'
    - force: True
    - makedirs: True
    - onlyif:
      - fun: file.file_exists
        path: '{{ APPDATA }}\Microsoft\Windows\Start Menu\kali-linux.lnk'

wsl-portals-shortcut-kali:
  file.copy:
    - name: '{{ inpath }}\Portals\Terminals\kali-linux.lnk'
    - source: '{{ START_PROGRAMS }}\kali-linux.lnk'
    - force: True
    - makedirs: True
    - onlyif:
      - fun: file.file_exists
        path: '{{ START_PROGRAMS }}\kali-linux.lnk'

{% endif %}
