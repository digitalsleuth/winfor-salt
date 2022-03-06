{% if grains['osrelease'] == "11" %}

Skipping Start Layout on Windows 11:
  test.nop

{% else %}

start-layout-file:
  file.managed:
    - name: 'C:\standalone\WIN-FOR-StartLayout.xml'
    - source: salt://winfor/config/layout/WIN-FOR-StartLayout.xml
    - win_inheritance: True
    - makedirs: True

start-layout-enable-gpo:
  lgpo.set:
    - user_policy:
        "Start Menu and Taskbar\\Start Layout":
          "Start Layout File": 
             'C:\standalone\WIN-FOR-StartLayout.xml'
    - computer_policy:
        "Start Menu and Taskbar\\Start Layout":
          "Start Layout File": 
             'C:\standalone\WIN-FOR-StartLayout.xml'

start-layout-update:
  cmd.run:
    - name: 'gpupdate /force'
    - shell: cmd

disable-locked-start-stager:
  file.managed:
    - name: 'C:\standalone\disable-locked-start.cmd'
    - source: salt://winfor/config/layout/disable-locked-start.cmd
    - win_inheritance: True
    - makedirs: True

disable-locked-start-layout-on-reboot-hkcu:
  reg.present:
    - name: HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "Disable Locked Start Layout"
    - vtype: REG_SZ
    - vdata: 'C:\Windows\system32\cmd.exe /q /c C:\standalone\disable-locked-start.cmd'
    - require:
      - lgpo: start-layout-enable-gpo
      - file: disable-locked-start-stager

disable-locked-start-layout-on-reboot-hklm:
  reg.present:
    - name: HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "Disable Locked Start Layout"
    - vtype: REG_SZ
    - vdata: 'C:\Windows\system32\cmd.exe /q /c C:\standalone\disable-locked-start.cmd'
    - require:
      - lgpo: start-layout-enable-gpo
      - file: disable-locked-start-stager

restart-explorer:
  cmd.run:
    - name: 'Stop-Process -ProcessName "explorer" -Confirm:$false -ErrorAction SilentlyContinue -Force'
    - shell: powershell

{% endif %}
