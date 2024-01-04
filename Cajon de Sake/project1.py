
# Bienvenida

print("Bienvenido a ... ")
print("""
              _                  __
   ____ ___  (_)  ________  ____/ /
  / __ `__ \/ /  / ___/ _ \/ __  /
 / / / / / / /  / /  /  __/ /_/ /
/_/ /_/ /_/_/  /_/   \___/\__,_/

""")

# Solicitud de nombre
nombre = input("Para empezar, dime como te llamas. ")
print()
print("Hola ", nombre, ", bienvenido a Mi Red")
print()

#edad
agno = int(input("Para preparar tu perfil, dime en que año naciste. "))
edad = 2017-agno-1
print()

#estatura
estatura = float(input("Cuentame mas de ti, para agregarlo a tu perfil. ¿Cuanto mides? Da­melo en metros. "))
estatura_m = int(estatura)
estatura_cm = int( (estatura - estatura_m)*100 )

# Cantidad de amigos
num_amigos = int(input("Muy bien. Finalmente, cuentame cuantos amigos tienes. "))

#Con los datos recolectados escribimos en pantalla un texto que resuma los datos que hemos obtenido
print()
print("Muy bien,", nombre, ". Entonces podemos crear un perfil con estos datos.")
print("--------------------------------------------------")
print("Nombre:  ", nombre)
print("Edad:    ", edad, "años")
print("Estatura:", estatura_m, "metros y", estatura_cm, "centimetros")
print("Amigos:  ", num_amigos)
print("--------------------------------------------------")
print("Gracias por la informacion. Esperamos que disfrutes con Mi Red")
print()

#Usaremos una variable bool para indicar si el usuario desea continuar
#utilizando el programa o no
continuar = True

#Este ciclo se mantiene en ejecucion hasta que el usuario desee salir
while continuar:

    #Solicitamos opcion al usuario
    escribir_mensaje = str(input(" ¿Deseas escribir un mensaje? (S/N) "))

    #Vamos a aceptar que el usuario ingrese un mensaje cuando escriban "S", "s", o nada
    if escribir_mensaje == "S" or escribir_mensaje == "s" or escribir_mensaje == "":
        mensaje = input("Vamos a publicar un mensaje. ¿Que piensas hoy? ")
        print()
        print("--------------------------------------------------")
        print(nombre, "dice:", mensaje)
        print("--------------------------------------------------")
    #En caso que sea otra respuesta, vamos a decidir salir.asda
    else:
        continuar = False

#Mensaje de salida, una vez que el ciclo ha terminado.
print("Gracias por usar Mi Red. ¡Hasta pronto!")
