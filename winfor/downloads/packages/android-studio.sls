# Name: Android Studio and SDK
# Website: https://developer.android.com/
# Description: Tools for debugging and accessing an Android device
# Category: Mobile Analysis
# Author: Google
# License: 
# Version: 2023.2.1.23
# Notes: Emulator comes with Android Studio, adb and fastboot are in the platform-tools, Build Tools can be downloaded using sdkmanager in the cmdline tools

{% set as_version = '2023.2.1.23' %}
{% set as_hash = '754049e35ffc060512eb6813e44e1a2b9dba1dabe8277274fd46638e196c3285' %}
{% set cmdline_version = '11076708' %}
{% set cmdline_hash = '4d6931209eebb1bfb7c7e8b240a6a3cb3ab24479ea294f3539429574b1eec862' %}
{% set platform_version = '35.0.0' %}
{% set platform_hash = '7ab78a8f8b305ae4d0de647d99c43599744de61a0838d3a47bda0cdffefee87e' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

android-studio-download-only:
  file.managed:
    - name: '{{ downloads }}\android-studio\android-studio-{{ as_version }}-windows.exe'
    - source: https://redirector.gvt1.com/edgedl/android/studio/install/{{ as_version }}/android-studio-{{ as_version }}-windows.exe
    - source_hash: sha256={{ as_hash }}
    - makedirs: True

cmdline-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\android-studio\cmdline-tools-win-{{ cmdline_version }}_latest.zip'
    - source: https://dl.google.com/android/repository/commandlinetools-win-{{ cmdline_version }}_latest.zip
    - source_hash: sha256={{ cmdline_hash }}
    - makedirs: True

platform-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\android-studio\platform-tools_r{{ platform_version }}-windows.zip'
    - source: https://dl.google.com/android/repository/platform-tools_r{{ platform_version }}-windows.zip
    - source_hash: sha256={{ platform_hash }}
    - makedirs: True
