{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% if grains['osrelease'] == "11" %}

CPC Skipping Start Layout on Windows 11:
  test.nop

{% else %}

start-layout-file-cpc:
  file.managed:
    - name: '{{ inpath }}\CPC-WIN-StartLayout.xml'
    - source: salt://cpcwin/config/layout/CPC-WIN-StartLayout.xml
    - win_inheritance: True
    - makedirs: True

start-layout-replace-placeholder-cpc:
  file.replace:
    - name: '{{ inpath }}\CPC-WIN-StartLayout.xml'
    - pattern: PLACEHOLDER_PATH
    - repl: {{ inpath | regex_escape }}
    - require:
      - file: start-layout-file-cpc

start-layout-enable-gpo-cpc:
  lgpo.set:
    - user_policy:
        "Start Menu and Taskbar\\Start Layout":
          "Start Layout File": 
             '{{ inpath }}\CPC-WIN-StartLayout.xml'
    - computer_policy:
        "Start Menu and Taskbar\\Start Layout":
          "Start Layout File": 
             '{{ inpath }}\CPC-WIN-StartLayout.xml'

disable-locked-start-stager-cpc:
  file.managed:
    - name: '{{ inpath }}\disable-locked-start.cmd'
    - source: salt://cpcwin/config/layout/disable-locked-start.cmd
    - win_inheritance: True
    - makedirs: True

disable-locked-start-layout-on-reboot-hkcu-cpc:
  reg.present:
    - name: HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "Disable Locked Start Layout"
    - vtype: REG_SZ
    - vdata: 'C:\Windows\system32\cmd.exe /q /c {{ inpath }}\disable-locked-start.cmd'
    - require:
      - lgpo: start-layout-enable-gpo-cpc
      - file: disable-locked-start-stager-cpc

disable-locked-start-layout-on-reboot-hklm-cpc:
  reg.present:
    - name: HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "Disable Locked Start Layout"
    - vtype: REG_SZ
    - vdata: 'C:\Windows\system32\cmd.exe /q /c {{ inpath }}\disable-locked-start.cmd'
    - require:
      - lgpo: start-layout-enable-gpo-cpc
      - file: disable-locked-start-stager-cpc

restart-explorer-cpc:
  cmd.run:
    - name: 'Stop-Process -ProcessName "explorer" -Confirm:$false -ErrorAction SilentlyContinue -Force'
    - shell: powershell

{% endif %}
