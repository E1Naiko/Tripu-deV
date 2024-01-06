# Sombrero sorteador 🧙‍♂️
# Codédex

gryffindor = 0
hufflepuff = 0
ravenclaw = 0
slytherin = 0

print('===============')
print('Sombrero Sorteador')
print('===============')

# ~~~~~~~~~~~~~~~Pregunta 1 ~~~~~~~~~~~~~~~

print("A) " + "Te gusta el amanecer o el anochecer?")

print("1. " + "Amanecer")
print("1. " + "Anochecer")

respuesta = int(input("Selecciona respuesta (1-2)"))

if respuesta == 1:
  griffindor += 1
  ravenclaw += 1
elif respuesta == 2:
  hufflepuff += 1
  slytherin += 1
else:
  print("Porfavor, solo selecciona 1 o 2")

# ~~~~~~~~~~~~~~~Pregunta 2 ~~~~~~~~~~~~~~~

print("B) Cuando mueras, ¿Como quieres que te recuerde la gente?")

print("1. El Bueno")
print("2. El Grande")
print("3. El Sabio")
print("4. El Negrito")

respuesta = int(input("Selecciona respuesta(1-4)"))

if respuesta == 1:
  hufflepuff += 2
elif respuesta == 2:
  slytherin += 2
elif respuesta == 3:
  ravenclaw += 2
elif respuesta == 4:
  gryffindor += 2
else:
  print("Porfavor, solo seleccione un numero del 1 al 4")

# ~~~~~~~~~~~~~~~Pregunta 3 ~~~~~~~~~~~~~~~
print("C) ¿Cual de estos instrumentos te gusta mas?")

print(' 1) El violín')
print(' 2) La trompeta')
print(' 3) El piano')
print(' 4) El tambor')

respuesta = int(input("Porfavor seleccione un numero(1-4)"))

if respuesta == 1:
  slytherin += 4
elif respuesta == 2:
  hufflepuff += 4
elif respuesta == 3:
  ravenclaw += 4
elif respuesta == 4:
  gryffindor += 4
else:
  print("Porfavor, solo seleccione un numero del 1 al 4")


print("Gryffindor: ", gryffindor)
print("Ravenclaw: ", ravenclaw)
print("Hufflepuff: ", hufflepuff)
print("Slytherin: ", slytherin)


most_points = max(gryffindor, ravenclaw, hufflepuff, slytherin)


if gryffindor == most_points:
  print('🦁 Gryffindor!')
elif ravenclaw == most_points:
  print('🦅 Ravenclaw!')
elif hufflepuff == most_points:
  print('🦡 Hufflepuff!')
else:
  print('🐍 Slytherin!')


