from PIL import Image

def pintame():
    print('        █░░░░░░░░░░░░░█')

# Define other functions here

cum = Image.open('cum.jpg')
num = int(input('Ingrese el numero de añitos: '))

output = []
for i in range(num):
    # Append the output of your functions to the 'output' list
    output.append(''.join([
        top1(),
        top2(),
        bottom(),
        ''.join([pintame() for j in range(num * 10)]),
        base1(),
        base2(),
        '\n'
    ]))

# Convert the 'output' list to a string
output = '\n'.join(output)

print(output)
