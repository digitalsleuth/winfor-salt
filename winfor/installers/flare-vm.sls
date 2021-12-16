flare-vm:
  file.managed:
    - name: C:\\salt\\tempdownload\\install.ps1
    - source: https://github.com/mandiant/flare-vm/raw/master/install.ps1
    - source_hash: sha256=eb71bc2816766c2eec28e5664d6d8a4fdf2481b19943fdb7de431b0fad3b2727

flare-vm-install:
  cmd.run:
    - name: "powershell.exe -ep bypass C:\\salt\\tempdownload\\install.ps1 -norestart -password forensics"
    - shell: powershell
