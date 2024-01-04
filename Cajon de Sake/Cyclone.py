height = int(input('Cual es tu altura?(cm)? '))
credits = int(input('Cuantos creditos tienes? '))

if height >= 137 and credits >= 10:
  print("Puedes subirte!")
elif height < 137 and credits >= 10:
  print("No tienes la altura para subirte")
elif height >= 137 and credits < 10:
  print("Te faltan creditos para subirte")
else:
  print("No tienes creditos ni eres lo suficientemente alto")
