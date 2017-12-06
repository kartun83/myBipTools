# myBipTools
Utilities for making Amazfit BIP watch faces

Requrements: python3, imagemagick

## font_convert.py
Tool for converting TTF/OTF fonts into PNG images

### Usage examples

`'./font_convert.py' -ttf thin.ttf --foreground=white -bg=bip_none -sz 25 -d delimeter --offset 62`

Generate numbers 0-9 as png images using font thin.ttf, and generate images from lines of file delimeter (one line per image), starting with 62.png as image for 0.
