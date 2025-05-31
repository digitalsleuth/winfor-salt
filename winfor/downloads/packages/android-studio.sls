# Name: Android Studio and SDK
# Website: https://developer.android.com/
# Description: Tools for debugging and accessing an Android device
# Category: Mobile Analysis
# Author: Google
# License: 
# Version: 2024.3.2.15
# Notes: Emulator comes with Android Studio, adb and fastboot are in the platform-tools, Build Tools can be downloaded using sdkmanager in the cmdline tools

{% set cmdline_version = '13114758' %}
{% set cmdline_hash = '98b565cb657b012dae6794cefc0f66ae1efb4690c699b78a614b4a6a3505b003' %}
{% set as_version = '2024.3.2.15' %}
{% set as_hash = 'da717086ed055c9d91658fb973336d2973244874dd333c863e0236f98b6660d1' %}
{% set platform_version = '36.0.0' %}
{% set platform_hash = '24bd8bebbbb58b9870db202b5c6775c4a49992632021c60750d9d8ec8179d5f0' %}
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
    - name: '{{ downloads }}\android-studio\platform-tools-latest-windows.zip'
    - source: https://dl.google.com/android/repository/platform-tools-latest-windows.zip
    - source_hash: sha256={{ platform_hash }}
    - makedirs: True
