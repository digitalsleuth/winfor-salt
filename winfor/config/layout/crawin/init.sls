{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

{% if grains['osrelease'] == "11" %}

CRA Skipping Start Layout on Windows 11:
  test.nop

{% else %}

start-layout-file-cra:
  file.managed:
    - name: '{{ inpath }}\CRA-WIN-StartLayout.xml'
    - source: salt://crawin/config/layout/CRA-WIN-StartLayout.xml
    - win_inheritance: True
    - makedirs: True

start-layout-replace-placeholder-cra:
  file.replace:
    - name: '{{ inpath }}\CRA-WIN-StartLayout.xml'
    - pattern: PLACEHOLDER_PATH
    - repl: {{ inpath | regex_escape }}
    - require:
      - file: start-layout-file-cra

start-layout-enable-gpo-cra:
  lgpo.set:
    - user_policy:
        "Start Menu and Taskbar\\Start Layout":
          "Start Layout File": 
             '{{ inpath }}\CRA-WIN-StartLayout.xml'
    - computer_policy:
        "Start Menu and Taskbar\\Start Layout":
          "Start Layout File": 
             '{{ inpath }}\CRA-WIN-StartLayout.xml'

disable-locked-start-stager-cra:
  file.managed:
    - name: '{{ inpath }}\disable-locked-start.cmd'
    - source: salt://crawin/config/layout/disable-locked-start.cmd
    - win_inheritance: True
    - makedirs: True

disable-locked-start-layout-on-reboot-hkcu-cra:
  reg.present:
    - name: HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "Disable Locked Start Layout"
    - vtype: REG_SZ
    - vdata: 'C:\Windows\system32\cmd.exe /q /c {{ inpath }}\disable-locked-start.cmd'
    - require:
      - lgpo: start-layout-enable-gpo-cra
      - file: disable-locked-start-stager-cra

disable-locked-start-layout-on-reboot-hklm-cra:
  reg.present:
    - name: HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "Disable Locked Start Layout"
    - vtype: REG_SZ
    - vdata: 'C:\Windows\system32\cmd.exe /q /c {{ inpath }}\disable-locked-start.cmd'
    - require:
      - lgpo: start-layout-enable-gpo-cra
      - file: disable-locked-start-stager-cra

restart-explorer-cra:
  cmd.run:
    - name: 'Stop-Process -ProcessName "explorer" -Confirm:$false -ErrorAction SilentlyContinue -Force'
    - shell: powershell

{% endif %}
