{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set files = [
                ('SQLiteQ', '7F979A622DE9E97B9682DC09A5156A1BD872139A9DD56BA60616FB824E77AB16'),
                ('ADOQuery', 'A412293B10AD00B0A94509CD48AD389C4F609B96FA504CCBBB2501742E3AD96D'),
                ('DataEdit', '9F950880508760C6709CCAADDC9D630903C9AE661DC99C50A5BAA85642141C46'),
                ('NetScanner', '15CC706B3A3FD735674729D0BE2084FBC56A1FB8FD4E113C27B632E7D7FEF7F6'),
                ('TMX', 'BFCE0718D2FA54ACAB5A74443170B1ACFCA77E9FE6A47058790B40546EABEA71'),
                ('SE', 'F9CEF0A01409A03B6EE42A6AE4AE64A71A4923CDA3E1E62C0E5998AF03FC938F'),
                ('IHB', '4C8421EA4C061F73D2EA142E29BB638FE656C01B07FFB909B62A08B552D35E68'),
                ('EHB', '6ECC87D4A0061CEDC13CCC398EB66009C39C5E36931737BB1841A373DE22C363'),
                ('WFA', '57ACAE30EA14576E06822703C6211C8F0C675286C989EE0CDAFEC23578E7A9C6'),
                ('WRR', '6FC38AC70B3A73829D045580327C057A3738D9158E67776F5DD788B91B940334'),
                ('SSView', '8CEB003A88ED985B772ACCB81551577CE363F268FE14EF23EC47F912B1ABE111'),
                ('HEXEdit', 'CFE264A121C560D69E2BB95512BE407F374164F2F79D0DDC4CEB7A8D0A09C788'),
                ('MailView', 'C2590633A9B13CC9D46A41A2980347057C84D8788A4597B83FFCC057FFD5B774'),
                ('EXE', '86573B2455A2CE7F8D4997A17170044B8F62A258923BDDDC1982AC8F2213544B'),
                ('XMLView', '93A22A6FAD75EB806E0B2EB54116E6470C7EDEE6ACBE299828DFB6A66DD45CE5'),
                ('JSONView', 'BC49223C10FAFC9110AEC17A64071A4BD91E3CFEF9BC0A167027D92F19197379'),
                ('PhotoView', '6BCBB3AAFD3DB71E7CBDFB75D78934101DED79A5792F52FBAE600EC16910795C')
               ] %}

{% for file, hash in files %}
mitec-download-{{ file }}:
  file.managed:
    - name: C:\salt\tempdownload\{{ file }}.zip
    - source: http://mitec.cz/Downloads/{{ file }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: true

mitec-unzip-{{ file }}:
  archive.extracted:
    - name: C:\standalone\mitec\{{ file }}
    - source: C:\salt\tempdownload\{{ file }}.zip
    - enforce_toplevel: false
    - require:
      - file: mitec-download-{{ file }}

winfor-standalones-mitec-{{ file }}-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\{{ file }}.lnk'
    - target: 'C:\standalone\mitec\{{ file }}\{{ file }}.exe'
    - force: True
    - working_dir: 'C:\standalone\mitec\{{ file }}\'
    - makedirs: True
    - require:
      - archive: mitec-unzip-{{ file }}

{% endfor %}
