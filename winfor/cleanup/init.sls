# Restart explorer to get rid of graphical anomalies after debloat
# Delete the C:\salt directory which contains the tempdownloads

cleanup-restart-explorer:
  cmd.run:
    - name: 'Stop-Process -ProcessName "explorer"'
    - shell: powershell

cleanup-delete-salt-temp-files:
  file.absent:
    - name: 'C:\salt'
