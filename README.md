# myBipTools
Utilities for making Amazfit BIP watch faces

Requrements: [**python3**](https://www.python.org/downloads/), [**imagemagick**](https://www.imagemagick.org/script/download.php)

## Note for Windows users
Install imagemagick with following options
- add application directory to your system path
Currently it doesn't work on windows10. Not tested on other systems

## Linux
Shold work out of box, in most distributions required software available via package manager. Tested on Linux mint 18.3 with default repositories. Should work with most Ubuntu family distributions.

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

## qBipDesigner
Goal of this tool to provide realtime feedback and allow user to design watch faces without minimal efforts and maximum productivity.
Currently it's proof of concept that this could be done mostly with pure QML\Javascript. At this time it could do:
- Load JSON file
- Locate images defined in JSON file
- Respond to changes in JSON data in embedded editor
*bad info* : currently it supports only background manipulation. It ignors all other properties.

**Requires** : QT5, build with QT 5.9
