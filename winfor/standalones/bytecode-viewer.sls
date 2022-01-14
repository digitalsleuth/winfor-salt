{% set version = '2.11.0' %}
{% set hash = '1864d43f252d57502be293d4043245dc742780c63860f6c5c450888c1e326788' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.installers.jre8

bytecode-viewer-download:
  file.managed:
    - name: 'C:\standalone\bytecode-viewer\Bytecode-Viewer-{{ version }}.jar'
    - source: https://github.com/Konloch/bytecode-viewer/releases/download/v{{ version }}/Bytecode-Viewer-{{ version }}.jar
    - source_hash: sha256={{ hash }}
    - makedirs: True

winfor-standalones-bytecode-viewer-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Bytecode Viewer.lnk'
    - target: 'C:\standalone\bytecode-viewer\Bytecode-Viewer-{{ version }}.jar'
    - force: True
    - working_dir: 'C:\standalone\bytecode-viewer\'
    - makedirs: True
    - require:
      - file: bytecode-viewer-download
      - sls: winfor.installers.jre8
