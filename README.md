# myBipTools
Utilities for making Amazfit BIP watch faces

Requrements: [**python3**](https://www.python.org/downloads/), [**imagemagick**](https://www.imagemagick.org/script/download.php)

## Note for Windows users
Download imagemagick portable and extract magick.exe and colors.xml into script directory.
Tested on windows10

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

**Requires** : QT5, build with QT 5.10

### Cross compiling for Windows
* Clone mxe(https://github.com/mxe/mxe)
* Check that qt compiles with current mxe(http://mxe.cc/build-matrix.html)
* If so, build gcc with `make MXE_TARGETS='x86_64-w64-mingw32.shared' gcc -j4 JOBS=4`
* Build required modules `make MXE_TARGETS='x86_64-w64-mingw32.shared' qtbase qtdeclarative qtgraphicaleffects qtimageformats qtmultimedia qtquickcontrols qtquickcontrols2 qtsystems qttools qttranslations qtwinextras -j4 JOBS=4
`, or build all with `make MXE_TARGETS='x86_64-w64-mingw32.shared' qt5 -j4 JOBS=4`
** Replace shared with static if you prefer static builds
** Adjust jobs count depending on your cpu
* For shared builds to assemble runtime:
** copydlldeps.sh
** If deploying directly from qt add build step : --copy --infile '%{CurrentRun:Executable:FilePath}' --enforcedir '%{Qt:QT_INSTALL_PREFIX}/plugins/platforms'  --enforcedir '%{Qt:QT_INSTALL_PREFIX}/qml/QtQuick/Controls.2'  --destdir '%{CurrentRun:Executable:NativePath}/deploy' --srcdir '%{Qt:QT_INSTALL_PREFIX}' --recursivesrcdir
