# Seems to be a strange issue with Windows 10 where the Import-Layout option
# doesn't actually seem to do anything.
# The following is a workaround to add the layout via GPO, restart explorer,
# disable the GPO, then restart explorer again.
#
# Other option is to edit HKEY_CURRENT_USER (and LOCAL_MACHINE)\SOFTWARE\Policies\Microsoft\Windows\Explorer and add:
# LockedStartLayout REG_DWORD 0
# StartLayoutFile REG_EXPAND_SZ C:\standalone\WIN-FOR-layout.xml
# REF: https://superuser.com/questions/1117136/import-startlayout-doesnt-change-anything

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

restart-explorer:
  cmd.run:
    - name: 'Stop-Process -ProcessName "explorer"'
    - shell: powershell
