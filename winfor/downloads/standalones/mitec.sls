# Name: MiTeC Tool Suite
# Website: https://mitec.cz
# Description: Suite of Windows-based analysis tools
# Category: Windows Analysis
# Author: Michal Mutl (mitec)
# License: Free to use for private, educational and non-commercial purposes
# Version: Various
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set files = [
                ('ADOQuery', 'A412293B10AD00B0A94509CD48AD389C4F609B96FA504CCBBB2501742E3AD96D'),
                ('DataEdit', '9F950880508760C6709CCAADDC9D630903C9AE661DC99C50A5BAA85642141C46'),
                ('NetScanner', '15CC706B3A3FD735674729D0BE2084FBC56A1FB8FD4E113C27B632E7D7FEF7F6'),
                ('TMX', 'd8ae1cd061dcb364aacfd36dfa382015bf831d1238d9ca50c24c4377ef82f3b7'),
                ('SE', 'F9CEF0A01409A03B6EE42A6AE4AE64A71A4923CDA3E1E62C0E5998AF03FC938F'),
                ('IHB', '94d513e5507e871b7d87246676f1072a92386e0b352ef7e02473a5812fd292db'),
                ('EHB', '6ECC87D4A0061CEDC13CCC398EB66009C39C5E36931737BB1841A373DE22C363'),
                ('WFA', '57ACAE30EA14576E06822703C6211C8F0C675286C989EE0CDAFEC23578E7A9C6'),
                ('WRR', '7d3d05c5df58fca2d8e10195f588b7c71213e94b1fb29e3a4be092d6b4a20e65'),
                ('SSView', 'e9d05067745a4f114b22dc798c7fa99017302b39bc8798853ed1bfd4c44d27ab'),
                ('HEXEdit', 'CFE264A121C560D69E2BB95512BE407F374164F2F79D0DDC4CEB7A8D0A09C788'),
                ('MailView', 'C2590633A9B13CC9D46A41A2980347057C84D8788A4597B83FFCC057FFD5B774'),
                ('EXE', '57ae1f5756af9f65be0b1abeb6b07cfdd60f1342905774e490f6fa5efd59f937'),
                ('XMLView', '93A22A6FAD75EB806E0B2EB54116E6470C7EDEE6ACBE299828DFB6A66DD45CE5'),
                ('JSONView', 'c37bc64c8fe476959cd6f4440d2b61c2af535e4f0201b8d71bbebc2e4a696386'),
                ('PhotoView', '6BCBB3AAFD3DB71E7CBDFB75D78934101DED79A5792F52FBAE600EC16910795C'),
                ('SQLiteQ', '7F979A622DE9E97B9682DC09A5156A1BD872139A9DD56BA60616FB824E77AB16')
               ] %}

{% for file, hash in files %}
mitec-download-only-{{ file }}:
  file.managed:
    - name: {{ downloads }}\{{ file }}.zip
    - source: http://mitec.cz/Downloads/{{ file }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: true
{% endfor %}
