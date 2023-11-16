from dibujitos import pintame, top1, top2, base1, base2
from PIL import Image
def bottom():
	print('		 █░░░░░░░░░░░░░░░░░░░█')
	print('		 ▀█░░░░░░░░░░░░░░░░░█▀')
	print('	 	  ▀█░░░░░░░░░░░░░░░█▀')
	print('		   ▀█░░░░░░░░░░░░░█▀')

cum = Image.open('cum.jpg')
num = int(input ('ingrese el numero de añitos: '))

for i in range(num):
	top1()
	top2()
	bottom()
	for j in range(num * 10):
		pintame()
	base1()
	base2()
	print()
	
cum.show()
