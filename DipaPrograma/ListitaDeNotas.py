vnombres= []
vcalifs = []
nota = 10
while nota > 0:
    nota = int(input("Nota: "))
    if nota > 0:
        vcalifs.append(nota)
        vnombres.append(input("Nombre: "))
print(vcalifs)
print(vnombres)
I=0
for i in range(0, len(vcalifs)):
    print("DATO ", i, " (", vnombres[i], vcalifs[i],")")
    I+=1
