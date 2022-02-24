winfor-config-copy-image:
  file.managed:
    - name: 'C:\Users\Public\Pictures\winfor-wallpaper.jpg'
    - source: salt://winfor/config/winfor-wallpaper.jpg

winfor-config-set-wallpaper:
  lgpo.set:
    - user_policy:
        Desktop Wallpaper:
            Wallpaper Name: C:\ProgramData\
            WallpaperStyle: Fill

winfor-config-update-gpo:
  cmd.run:
    - name: gpupdate /force
