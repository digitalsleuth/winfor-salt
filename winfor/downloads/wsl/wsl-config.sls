{% set wsl_choice = salt['pillar.get']('wsl_choice', 'siftrem') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set PROGRAM_FILES = salt['environ.get']('PROGRAMFILES') %}
{% set START_MENU = PROGRAMDATA ~ '\\Microsoft\\Windows\\Start Menu' %}
{% set START_PROGRAMS = START_MENU ~ '\\Programs' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
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
{% set shortcut_name = folder|upper ~ '.lnk' %}

{{ wsl_install(
    'wsl-make-install-directory',
    'wsl-install-distro',
    inpath ~ '\\wsl\\' ~ folder,
    'wsl --install Ubuntu-24.04 --name ' ~ distro ~ ' --location ' ~ inpath ~ '\\wsl\\' ~ folder ~ ' -n',
    inpath ~ '\\wsl\\' ~ folder ~ '\\ext4.vhdx'
) }}

{{ wsl_apt_update('wsl-apt-update-upgrade-download-only', wsl_cmd, 'wsl-install-distro-download-only') }}

{{ wsl_bootstrap_user(
    'wsl-bootstrap-user-forensics-download-only',
    wsl_cmd, 'wsl-install-distro-download-only', 'wsl-apt-update-upgrade-download-only', user_pass
) }}

wsl-download-cast-download-only:
  cmd.run:
    - name: '{{ wsl_cmd }} wget -O /cast-v{{ castver }}.deb https://github.com/ekristen/cast/releases/download/v{{ castver }}/cast-v{{ castver }}-linux-amd64.deb'
    - shell: cmd
    - unless: '{{ wsl_cmd }} command -v cast'
    - require:
      - cmd: wsl-install-distro-download-only
      - cmd: wsl-bootstrap-user-forensics-download-only

wsl-install-cast-download-only:
  cmd.run:
    - name: '{{ wsl_cmd }} dpkg -i /cast-v{{ castver }}.deb'
    - shell: cmd
    - unless: '{{ wsl_cmd }} command -v cast'
    - require:
      - cmd: wsl-download-cast-download-only

wsl-remove-cast-binary-download-only:
  cmd.run:
    - name: '{{ wsl_cmd }} rm /cast-v{{ castver }}.deb'
    - shell: cmd
    - onlyif: '{{ wsl_cmd }} test -f /cast-v{{ castver }}.deb'
    - require:
      - cmd: wsl-install-cast-download-only

{% if wsl_choice in ('sift', 'siftrem', 'all') %}
wsl-cast-install-sift-download-only:
  cmd.run:
    - name: '{{ wsl_cmd }} bash -c "cast install --mode server --user forensics sift || true"'
    - shell: cmd
    - creates: '\\\\wsl.localhost\\{{ distro }}\\home\\forensics\\sift-saltstack.log'
    - require:
      - cmd: wsl-remove-cast-binary-download-only

wsl-copy-cast-sift-results-download-only:
  cmd.run:
    - name: '{{ wsl_cmd }} cp /var/cache/cast/installer/logs/saltstack.log /home/forensics/sift-saltstack.log'
    - shell: cmd
    - creates: '\\\\wsl.localhost\\{{ distro }}\\home\\forensics\\sift-saltstack.log'
    - require:
      - cmd: wsl-cast-install-sift-download-only
{% endif %}

{% if wsl_choice in ('remnux', 'siftrem', 'all') %}
wsl-cast-install-remnux-download-only:
  cmd.run:
    - name: '{{ wsl_cmd }} bash -c "cast install --mode cloud --user forensics remnux || true"'
    - shell: cmd
    - creates: '\\\\wsl.localhost\\{{ distro }}\\home\\forensics\\remnux-saltstack.log'
    - require:
      - cmd: wsl-remove-cast-binary-download-only

wsl-copy-cast-remnux-results-download-only:
  cmd.run:
    - name: '{{ wsl_cmd }} cp /var/cache/cast/installer/logs/saltstack.log /home/forensics/remnux-saltstack.log'
    - shell: cmd
    - creates: '\\\\wsl.localhost\\{{ distro }}\\home\\forensics\\remnux-saltstack.log'
    - require:
      - cmd: wsl-cast-install-remnux-download-only

wsl-cleanup-remnux-download-only:
  cmd.run:
    - name: '{{ wsl_cmd }} bash -c "rm -rf /usr/local/src/remnux/files/*"'
    - shell: cmd
    - require:
      - cmd: wsl-cast-install-remnux-download-only
{% endif %}

wsl-setup-mounts-and-cleanup-download-only:
  cmd.run:
    - name: |
        {{ wsl_cmd }} bash -c "mkdir -p /mnt/{aff,bde,e01,ewf,ewf_mount,iscsi,shadow_mount,usb,vss,windows_mount} && mkdir -p /mnt/windows_mount{1..5} /mnt/shadow_mount/vss{1..30} && rm -rf /var/cache/salt/* /srv/* /root/.cache/* /var/cache/cast/*"
    - shell: cmd
    - require:
      - cmd: wsl-install-distro-download-only

wsl-set-default-user-download-only:
  cmd.run:
    - name: 'wsl --manage {{ distro }} --set-default-user forensics'
    - shell: cmd
    - require:
      - cmd: wsl-bootstrap-user-forensics-download-only

wsl-shutdown-download-only:
  cmd.run:
    - name: 'wsl --shutdown'
    - shell: cmd
    - require:
      - cmd: wsl-set-default-user-download-only
      - cmd: wsl-setup-mounts-and-cleanup-download-only

{{ wsl_diskpart_compact(
    'wsl-create-diskpart-script-download-only', 'wsl-diskpart-compact-download-only',
    inpath ~ '\\wsl\\' ~ folder ~ '\\ext4.vhdx', inpath ~ '\\wsl\\' ~ folder ~ '\\diskpart-compact.txt',
    'wsl-shutdown-download-only'
) }}


wsl-non-kali-sync-download-only:
  test.nop:
    - require:
      - cmd: wsl-diskpart-compact-download-only

{% endif %}

{% if wsl_choice in ('kali', 'all') %}
{% set kali_cmd = 'wsl -d kali-linux' %}

{{ wsl_install(
    'wsl-make-kali-install-directory-download-only',
    'wsl-install-kali-download-only',
    inpath ~ '\\wsl\\kali',
    'wsl --install kali-linux --location ' ~ inpath ~ '\\wsl\\kali -n',
    inpath ~ '\\wsl\\kali\\ext4.vhdx',
    extra_require='- test: wsl-non-kali-sync-download-only' if non_kali else ''
) }}

{{ wsl_apt_update('wsl-apt-update-upgrade-kali-download-only', kali_cmd, 'wsl-install-kali-download-only') }}

{{ wsl_bootstrap_user(
    'wsl-bootstrap-user-kali-download-only',
    kali_cmd, 'wsl-install-kali-download-only', 'wsl-apt-update-upgrade-kali-download-only', user_pass
) }}

wsl-install-kali-pkgs-download-only:
  cmd.run:
    - name: '{{ kali_cmd }} DEBIAN_FRONTEND=noninteractive apt install kali-linux-large kali-win-kex -y'
    - shell: cmd
    - require:
      - cmd: wsl-bootstrap-user-kali-download-only

wsl-set-default-user-kali-download-only:
  cmd.run:
    - name: 'wsl --manage kali-linux --set-default-user forensics'
    - shell: cmd
    - require:
      - cmd: wsl-install-kali-pkgs-download-only

wsl-shutdown-kali-download-only:
  cmd.run:
    - name: 'wsl --shutdown'
    - shell: cmd
    - require:
      - cmd: wsl-set-default-user-kali-download-only

{{ wsl_diskpart_compact(
    'wsl-create-diskpart-script-kali-download-only', 'wsl-diskpart-compact-kali-download-only',
    inpath ~ '\\wsl\\kali\\ext4.vhdx', inpath ~ '\\wsl\\kali\\diskpart-compact.txt',
    'wsl-shutdown-kali-download-only'
) }}

{% endif %}

wsl-move-kali-download-only:
  file.rename:
    - name: '{{ downloads }}\wsl\kali'
    - source: '{{ inpath }}\wsl\kali\'
    - onlyif:
      - fun: file.directory_exists
        path: '{{ inpath }}\wsl\kali'

wsl-move-remnux-download-only:
  file.rename:
    - name: '{{ downloads }}\wsl\remnux'
    - source: '{{ inpath }}\wsl\remnux\'
    - onlyif:
      - fun: file.directory_exists
        path: '{{ inpath }}\wsl\remnux'

wsl-move-sift-download-only:
  file.rename:
    - name: '{{ downloads }}\wsl\sift'
    - source: '{{ inpath }}\wsl\sift\'
    - onlyif:
      - fun: file.directory_exists
        path: '{{ inpath }}\wsl\sift'

wsl-move-siftrem-download-only:
  file.rename:
    - name: '{{ downloads }}\wsl\siftrem'
    - source: '{{ inpath }}\wsl\siftrem\'
    - onlyif:
      - fun: file.directory_exists
        path: '{{ inpath }}\wsl\siftrem'
