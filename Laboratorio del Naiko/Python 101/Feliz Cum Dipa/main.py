from PIL import Image
from dibujitos import pintame, base1, base2, top1, top2

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
