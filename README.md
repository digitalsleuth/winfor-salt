# winfor-salt
Windows Forensics Salt States

The design behind this is to use a barebones Windows 10 VM (preferably 1909 and higher),
install [Git](https://git-scm.com/download/win), then install [Saltstack 3004](https://repo.saltproject.io/windows/Salt-Minion-3004-3-Py3-AMD64-Setup.exe)
using the following command:
Salt-Minion-3004-3-Py3-AMD64-Setup.exe /S /master=localhost /minion-name=localhost

Once the install of the above are completed, you can test the states out by doing the following:
Open an Administrator Command Prompt and run:
```git clone https://github.com/digitalsleuth/winfor-salt/ "C:\ProgramData\Salt Project\Salt\srv\salt"
salt-call -l debug --local --retcode-passthrough --state-output=mixed state.sls winfor.dedicated pillar="{'winfor_user': '<username>'}" --log-file="C:\saltstack.log" --log-file-level=debug --out-file="C:\saltstack.log" --out-file-append
```

NOTE: Replace `<username>` with the desired username for the VM. If the user does not exist, it will be created.

Once an installer has been created, it will be made available!
