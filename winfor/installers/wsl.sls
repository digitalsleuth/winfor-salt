# Run the following dism commands to configure WSL then reboot
# This will prevent having to download an actual repo, and allow
# an import of a configured distro. Distro already has updates as well
# Ensure virtualization enabled in VM for WSL to get to version 2
#
# dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
# REBOOT
# msiexec /i https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi /qn /norestart
# wsl --set-default-version 1
# wsl --import Ubuntu-20.04 <PlaceToInstallTheOS> <TAR-File>
# Will still need to set the hostname
# Create shortcut for wsl --user forensics

wsl-install:
  cmd.run:
    - name: 'dism.exe /online  /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart'
    - shell: cmd

vmp-install:
  cmd.run:
    - name: 'dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart'
    - shell: cmd

#wsl-install:
#  cmd.run:
#    - name: 'wsl --install -d Ubuntu-20.04'
#    - shell: cmd

#wsl-bcdedit:
#  cmd.run:
#    - name: 'bcdedit /set hypervisorlaunchtype auto start'
#    - shell: cmd
#    - order: last

system-restart:
  system.reboot:
    - timeout: 0
    - in_seconds: True
    - only_on_pending_reboot: False
    - order: last
    - require:
      - cmd: wsl-install
      - cmd: vmp-install
