#{% set wallpaper = [('red', '22243006EA2EAD213A20A6679A154CCD9A9373BA08F60DEA1512D4AAB9A3638C')] %}
{% set colour = 'blue' %}
{% set hash = '423EE00AFDB44EC7FA480DB803E6C0C55DD9EED7ECF88DEB2453D47972749C9C' %}

winfor-theme-wallpaper-source:
  file.managed:
    - name: 'C:\standalone\winfor-wallpaper-{{ colour }}.png'
    - source: salt://winfor/theme/winfor-wallpaper-{{ colour }}.png
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
    - vdata: 'C:\standalone\winfor-wallpaper-{{ colour }}.png'

winfor-theme-set-wallpaper-center:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Desktop
    - vname: WallpaperStyle
    - vtype: REG_SZ
    - vdata: 0

winfor-theme-set-wallpaper-no-tile:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Desktop
    - vname: TileWallpaper
    - vtype: REG_SZ
    - vdata: 0

#Set Wallpaper:
#  lgpo.set:
#    - user_policy:
#        Desktop Wallpaper:
#            Wallpaper Name: 'C:\standalone\winfor-wallpaper-{{ colour }}.png'
#            Wallpaper Style: Center
#    - require:
#      - file: winfor-wallpaper-copy

winfor-theme-update-wallpaper:
  cmd.run:
    - name: 'RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1, True'
    - shell: cmd


