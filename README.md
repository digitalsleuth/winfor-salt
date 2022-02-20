# WIN-FOR Salt States
Windows Forensics VM Salt States

The design behind this is to use a barebones Windows 10 VM (preferably 1909 and higher to support WSLv2).
Once configured, and activated (to support customization features), then you can use the install.ps1 file to
install all of the packages.

The install requires that the `Set-ExecutionPolicy` feature be set to allow the script to run, at least twice, depending on your choices.
This is best left to you to decide what is acceptable in your organization.

## Usage
```text
Usage:
  .\install.ps1 -user <user> -mode <mode> -wsl -update -upgrade
  .\install.ps1 -version

Options:
  -user <user>	User used for configuration of VM and software, default is current user
  -mode <mode>	WIN-FOR Install mode (addon (applications only, no customization); dedicated (everything))
  -wsl		Also install the Windows Subsystem for Linux v2 with SIFT and REMnux installed
		This will cause a reboot, and will be run after all other installs are complete
		Can be used separately one a full install and customization
  -version	Provides the current version of WIN-FOR, will display `not installed` on first run or
		on subsequent runs where the installation is incomplete
  -update	Feature coming soon
  -upgrade	Feature coming soon
```

## Issues

A new [WIN-FOR Repo](https://github.com/digitalsleuth/winfor) will be set up soon, for now, issues can be raised
in this repo.

## What the install.ps1 does

Installs [Saltstack 3004](https://repo.saltproject.io/windows/Salt-Minion-3004-3-Py3-AMD64-Setup.exe) then installs 
[Git](https://git-scm.com/download/win), then runs the following commands:
```
git clone https://github.com/digitalsleuth/winfor-salt/ "C:\ProgramData\Salt Project\Salt\srv\salt"
salt-call -l debug --local --retcode-passthrough --state-output=mixed state.sls winfor.$mode pillar="{'winfor_user': '$user'}" --log-file="C:\winfor-saltstack.log" --log-file-level=debug --out-file="C:\winfor-saltstack.log" --out-file-append
```
