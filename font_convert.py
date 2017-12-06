#!/usr/bin/python3

""" Font converter for Amazfit BIP """

import argparse
import os

class App(object):
	"""docstring for App"""
	def __init__(self):
		super(App, self).__init__()
		parser = argparse.ArgumentParser(description='Convert TTF glyphs to PNG images')		
		parser.add_argument('-ttf', '--font', type=str, help='TTF font filename', required=True)
		parser.add_argument('-s', '--start', type=int, help='Starting number', default = 0)
		parser.add_argument('-t', '--finish', type=int, help='Finish number', default = 9)
		parser.add_argument('-o', '--offset', type=int, help='Numbering offset', default = 0)
		parser.add_argument('-sd', '--skip_dights', help='Do not generate dights, process only days file', action='store_true')
		parser.add_argument('-sz', '--pointsize', type=int, help='Point size', default = 60)
		parser.add_argument('-fg', '--foreground', type=str, help='Foreground color', required=True)
		parser.add_argument('-bg', '--background', type=str, help='Background color. Use "bip_none" to set background to #FEFE00', required=True)
		parser.add_argument('-p', '--prefix', type=str, help='Prefix for fileame', default = '')		
		parser.add_argument('-d', '--days_file', type=str, help='Filename with additional required texts', default = '')
		"""parser.set_defaults(skip_dights=False) """
		self._args = parser.parse_args()

		self._colors = ['black','blue','green','red','aqua','cyan',' fuchsia', 'magenta','yellow','white','bip_none',
						'#000000' ,'#0000FF' ,'#00FF00' ,'#FF0000' ,'#00FFFF' ,'#FF00FF' ,'#FFFF00' ,'#FFFFFF' ,'#FEFE00']
		pass

	def doConversion(self):
		self.checkArguments()
				
		if not self._args.skip_dights:
			for x in range(self._args.start,self._args.finish+1):
				os.system('convert -background "{2}" -fill "{3}" -font {1} -pointsize {4} label:"{0}" "{5}{6}.png"'.format(x, self._args.font, self._args.background, self._args.foreground, self._args.pointsize,
					self._args.prefix, self._args.offset + x))
				pass		
		if self._args.days_file:
			with open(self._args.days_file, 'r') as f:
				for cnt, line in enumerate(f):					
					os.system('convert -background "{2}" -fill "{3}" -font {1} -pointsize {4} label:"{0}" "{0}.png"'.format(line , self._args.font, self._args.background, self._args.foreground, self._args.pointsize,
					self._args.prefix))
					pass	
				pass
		pass

	def checkArguments(self):		
		if self._args.background not in self._colors:
			print('Warning: {0} defined for background is not in supported colors list '.format(self._args.background))
		if self._args.foreground not in self._colors:
			print('Warning: {0} defined for foreground is not in supported colors list '.format(self._args.foreground))
		pass	
		if self._args.background == 'bip_none': self._args.background = '#FEFE00'



def main():
	''' Creates instance of App and initiates input loop '''
	#app = App()
	#app.mainLoop()
	App().doConversion()

main() 