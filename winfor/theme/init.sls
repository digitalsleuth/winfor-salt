{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set all_users = salt['user.list_users']() %}
{% if user in all_users %}
  {% set home = salt['user.info'](user).home %}
{% else %}
  {% set home = "C:\\Users\\" + user %}
{% endif %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '24f62d8212f25e16cf384779c48876a11f8d9430b597f066d81c0df5ee8594c6' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set profile_pictures = ['user.png', 'user.bmp', 'user-32.png', 'user-40.png', 'user-48.png', 'user-192.png'] %}
{% set portals_configs = ['portals.ptl','globalsettings.ptl'] %}
{% set shortcuts = [('Acquisition and Analysis', ['FTK Imager','Active@ Disk Editor\Active@ Disk Editor','Arsenal Image Mounter','Autopsy\Autopsy 4.19.3','Magnet AXIOM\AXIOM Examine','Magnet AXIOM\AXIOM Process','Cerbero Suite\Cerbero Suite','gkape','Magnet ACQUIRE\Magnet ACQUIRE','Magnet Chromebook Acquisition Assistant v1\Magnet Chromebook Acquisition Assistant v1','Magnet Web Page Saver Portable V3','Tableau\Tableau Imager\Tableau Imager']),
                        ('Browsers', ['Firefox','Google Chrome','Microsoft Edge']),
                        ('Databases', ['ADOQuery','DataEdit','DB Browser (SQLCipher)','DB Browser (SQLite)','DBeaver Community\DBeaver','SDBExplorer','SQLiteQuery','SQLiteStudio\SQLiteStudio','SysTools SQL MDF Viewer\SysTools SQL MDF Viewer']),
                        ('Document Analysis', ['OffVis','PDFStreamDumper\PdfStreamDumper.exe','SSView']),
                        ('Document Viewers', ['Acrobat Reader','EZViewer','LibreOffice 7.4\LibreOffice Calc','LibreOffice 7.4\LibreOffice Impress','LibreOffice 7.4\LibreOffice Writer','LibreOffice 7.4\LibreOffice','Notepad++','Sublime Text','Visual Studio Code\Visual Studio Code']),
                        ('Email', ['EHB','Kernel Exchange EDB Viewer\Kernel Exchange EDB Viewer','Kernel OST Viewer\Kernel OST Viewer','Kernel Outlook PST Viewer\Kernel Outlook PST Viewer','MailView','SysTools Outlook PST Viewer\SysTools Outlook PST Viewer','BitRecover EML Viewer',"4n6 Software\\4n6 Email Forensics Wizard",'PST Walker\PST Walker']),
                        ('Executables', ['rohitab.com\API Monitor v2\API Monitor v2 (Alpha) 64-bit','Explorer Suite\CFF Explorer','Cutter','DIE','dotPeek64','ExeInfoPE','McAfee FileInsight\FileInsight','ILSpy','MalCat','Explorer Suite\Tools\PE Detective','Process Hacker 2\PE Viewer','PE-Bear','PEiD','PEStudio','PPEE','Process Hacker 2\Process Hacker 2','Regshot x64 Unicode','Resource Hacker\Resource Hacker','Scylla x64','Explorer Suite\Signature Explorer','Explorer Suite\Task Explorer (64-bit)','VB Decompiler Lite\VB Decompiler Lite']),
                        ('Installers', ['AutoIT Extractor','lessmsi','Py2ExeDecompiler','UniExtract']),
                        ('Logs', ['EventFinder','EZViewer','HttpLogBrowser\HttpLogBrowser','Log Parser 2.2\Log Parser 2.2','LogParser-Studio','LogViewer2']),
                        ('Mobile Analysis', ['ALEAPP-GUI','Bytecode Viewer','ILEAPP-GUI','iPhoneAnalyzer','VLEAPP-GUI']),
                        ('Network', ['Brim','Burp Suite Community Edition\Burp Suite Community Edition','Fiddler Classic','IHB','NetScanner','PuTTY (64-bit)\PSFTP','PuTTY (64-bit)\PuTTY','Wireshark']),
                        ('Raw Parsers and Decoders', ['Bulk Extractor 1.5.5\BEViewer with Bulk Extractor 1.5.5 (64-bit)','CyberChef','Digital Detective\DataDump v2\DataDump v2.0','Digital Detective\DCode v5\DCode v5.5','HHD Hex Editor Neo\Hex Editor Neo','HEXEdit','HxD Hex Editor\HxD','JSONView','Passware\Encryption Analyzer 2023 v1\Passware Encryption Analyzer 2023 v1 (64-bit)','Redline\Redline','XMLView']),
                        ('Registry', ['RegistryExplorer','RegRipper','Regshot x64 ANSI']),
                        ('Terminals', ['Cygwin\Cygwin64 Terminal','MobaXterm\MobaXterm']),
                        ('Utilities', ['Digital Detective\DCode v5\DCode v5.5','EZViewer','FastCopy','Hasher','IrfanView\IrfanView 64 4.60',"Nuix\\Nuix Evidence Mover\\Nuix Evidence Mover",'Rufus','Sysinternals','Tableau\Tableau Firmware Update\Tableau Firmware Update','USB Write Blocker','WindowGrid','VcXsrv\XLaunch']),
                        ('Windows Analysis', ['AutoRunner','EXE','JumpListExplorer','LogFileParser64','MFTBrowser','MFTExplorer','NirLauncher','NTFS Log Tracker','Redline\Redline','RegistryExplorer','RegRipper','SE','ShadowExplorer','ShellBagsExplorer','SRUM-DUMP2','TimelineExplorer','WLEAPP-GUI'])
                       ] %}

include:
  - winfor.packages.portals
  - winfor.config.user

winfor-theme-wallpaper-source:
  file.managed:
    - name: '{{ inpath }}\winfor-wallpaper-blue.png'
    - source: salt://winfor/theme/winfor-wallpaper-blue.png
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - win_inheritance: True

winfor-theme-desktop-background-color:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Colors
    - vname: Background
    - vtype: REG_SZ
    - vdata: "0 0 0"

winfor-theme-set-wallpaper:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Desktop
    - vname: WallPaper
    - vtype: REG_SZ
    - vdata: '{{ inpath }}\winfor-wallpaper-blue.png'

winfor-theme-set-wallpaper-center:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Desktop
    - vname: WallpaperStyle
    - vtype: REG_SZ
    - vdata: 6

winfor-theme-set-wallpaper-no-tile:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Desktop
    - vname: TileWallpaper
    - vtype: REG_SZ
    - vdata: 0

winfor-theme-update-wallpaper:
  cmd.run:
    - name: 'RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1, True'
    - shell: cmd

{% for file in profile_pictures %}

winfor-theme-profile-picture-backup-{{ file }}:
  file.managed:
    - name: 'C:\ProgramData\Microsoft\User Account Pictures\{{ file }}.bak'
    - source: 'C:\ProgramData\Microsoft\User Account Pictures\{{ file }}'
    - skip_verify: True

winfor-theme-profile-picture-copy-{{ file }}:
  file.managed:
    - name: 'C:\ProgramData\Microsoft\User Account Pictures\{{ file }}'
    - source: salt://winfor/theme/{{ file }}
    - skip_verify: True
    - replace: True
    - require:
      - file: winfor-theme-profile-picture-backup-{{ file }}

{% endfor %}

winfor-theme-default-profile-picture:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer
    - vname: UseDefaultTile
    - vtype: REG_DWORD
    - vdata: 1

{% for folder in shortcuts %}
shortcut-{{ folder[0] }}:
  file.directory:
    - name: '{{ inpath }}\Portals\{{ folder[0] }}'
    - makedirs: True
    - replace: True
    - win_inheritance: True
{% for shortcut in folder[1] %}
{% set shortcut = shortcut + ".lnk" %}
shortcut-{{ folder[0] }}-{{ shortcut }}:
  file.copy:
    - name: '{{ inpath }}\Portals\{{ folder[0] }}\'
    - source: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\{{ shortcut }}'
    - preserve: True
    - subdir: True
{% endfor %}
{% endfor %}

{% if salt['file.file_exists'](PROGRAMDATA + '\Microsoft\Windows\Start Menu\Programs\X-Ways.lnk') %}
xways-shortcut-copy:
  file.copy:
    - name: '{{ inpath }}\Portals\Acquisition and Analysis\X-Ways.lnk'
    - source: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\X-Ways.lnk'
    - preserve: True

{% else %}
no-xways-shortcut-found:
  test.nop
{% endif %}

{% if salt['file.file_exists'](PROGRAMDATA + '\Microsoft\Windows\Start Menu\Programs\WinHex.lnk') %}
winhex-shortcut-copy:
  file.copy:
    - name: '{{ inpath }}\Portals\Raw Parsers and Decoders\WinHex.lnk'
    - source: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\WinHex.lnk'
    - preserve: True

{% else %}
no-winhex-shortcut-found:
  test.nop
{% endif %}

{% if salt['file.file_exists'](PROGRAMDATA + '\Microsoft\Windows\Start Menu\Programs\WSL.lnk') %}
wsl-shortcut-copy:
  file.copy:
    - name: '{{ inpath }}\Portals\Terminals\WSL.lnk'
    - source: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\WSL.lnk'
    - preserve: True

{% else %}
no-wsl-shortcut-found:
  test.nop
{% endif %}

portals-end-process:
  cmd.run:
    - name: 'taskkill /F /IM "Portals.exe"'
    - bg: True
    - require:
      - sls: winfor.packages.portals

{% for config in portals_configs %}
portals-{{ config }}-copy:
  file.managed:
    - name: '{{ home }}\AppData\Local\Portals\{{ config }}'
    - source: salt://winfor/files/{{ config }}
    - makedirs: True
    - replace: True
    - require:
      - user: winfor-user-{{ user }}
      - sls: winfor.packages.portals

portals-{{ config }}-placeholder-replace:
  file.replace:
    - name: '{{ home }}\AppData\Local\Portals\{{ config }}'
    - pattern: PLACEHOLDER_PATH
    - repl: {{ inpath | regex_escape }}
    - require:
      - file: portals-{{ config }}-copy
{% endfor %}

portals-auto-run:
  reg.present:
    - name: HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
    - vname: Portals
    - vtype: REG_SZ
    - vdata: 'C:\Program Files\Portals\Portals.exe'
    - require:
      - sls: winfor.packages.portals
