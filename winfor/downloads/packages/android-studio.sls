# Name: Android Studio and SDK
# Website: https://developer.android.com/
# Description: Tools for debugging and accessing an Android device
# Category: Mobile Analysis
# Author: Google
# License: 
# Version: 2023.1.1.27
# Notes: Emulator comes with Android Studio, adb and fastboot are in the platform-tools, Build Tools can be downloaded using sdkmanager in the cmdline tools

{% set as_version = '2023.1.1.27' %}
{% set as_hash = '495d55bdd8bc1b8c6a41fcc5a31f8db0fbcd3199a82fc4b0847d32f99fbe11b6' %}
{% set cmdline_version = '11076708' %}
{% set cmdline_hash = '4d6931209eebb1bfb7c7e8b240a6a3cb3ab24479ea294f3539429574b1eec862' %}
{% set platform_version = '34.0.5' %}
{% set platform_hash = '3f8320152704377de150418a3c4c9d07d16d80a6c0d0d8f7289c22c499e33571' %}
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
