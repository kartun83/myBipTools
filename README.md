# myBipTools
Utilities for making Amazfit BIP watch faces

Requrements: **python3**, **imagemagick**

## font_convert.py
Tool for converting TTF/OTF fonts into PNG images. Allow to generate images for dights, and/or images for texts defined in file, one line per text entry

### Usage examples
`'./font_convert.py' --help`

Get basic help on available commands

`'./font_convert.py' -ttf thin.ttf --foreground=white -bg=bip_none -sz 25 -d delimeter --offset 62`

Generate numbers 0-9 as png images using font *thin.ttf*, and generate images from lines of file *delimeter* (one line per image), starting with 62.png as image for 0.

`'./font_convert.py' -ttf thin.ttf --foreground=white -bg=bip_none -sz 25 -d delimeter -sd -p prefix`

Generate images only from file *delimeter*, without generating dights, prefixing generated filenames with text 'prefix', for example 'prefixJan.png', if file *delimeter* contains only single line with text 'Jan'

**Colors**
Amazfit BIP supports limited colors, use this constants to be on a safe side. Actually RGB color could be used, for example `./font_convert.py' --foreground='#0000FF'`. Tool would try to analyze supplied color and generate warnings if unsupported color is used.
* black
* blue
* green
* red
* aqua, cyan
* fuchsia, magenta
* yellow
* white
* bip_none. Actual transparency for png: none. Not sure if BIP can handle this properly
