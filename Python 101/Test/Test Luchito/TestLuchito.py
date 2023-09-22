def contar_aprobados(notas_alumnos):
    aprobados = 0
    for nombre, nota in notas_alumnos.items():
        if nota >= 7:
            aprobados += 1
    return aprobados

def promedio(notas_alumnos): # definimos la funcion, en este caso es el promedio
    prom = 0
    for nombre, nota in notas_alumnos.items(): # con el for, lo que hacemos es hacer que el vector recorra todo, desde inicio al fin, pasando por el nombre y las notas de los alumnos
        prom = prom+nota #Lo que realizamos aca es ir acumulando las notas, sumandolas
    prom = prom/len(notas_alumnos)
    return prom

def promedio_aprobados(notas_alumnos):
    proma = 0
    notas_aprobados = [] #la linea completa es un array, los corchetes indican que es vacio
    for nombre, nota in notas_alumnos.items():
        if nota >= 7:
            proma += 1
            notas_aprobados.append (nota)
    proma = prom/len(notas_aprobados) #len: da la maxima longitud de una regla (Te cuenta todo lo que pongas dentro del parametro definido, en este caso notas_alumnos)
    return proma
        
def nota_max(notas_alumnos):
    nmax = 0
    for nombre, nota in notas_alumnos.items():
        if nota > nmax:
            nmax = nota
    return nmax
        
def nota_min(notas_alumnos):
    nmin = 999
    for nombre, nota in notas_alumnos.items():
        if nota < nmin:
            nmin = nota
    return nmin

def alumnos_desaprobados(notas_alumnos):
    for nombre, nota in notas_alumnos.items():
        if nota < 7:
            print(f"el alumnos desaprobados: {nombre}")
            
def alumnos_10(notas_alumnos):
    for nombre, nota in notas_alumnos.items():
        if nota == 10:
            print(f"el alumnos con 10: {nombre}")

def alumno_nota_min(notas_alumnos):
    nmin = 999
    for nombre, nota in notas_alumnos.items():
        if nota < nmin:
            nmin = nota
            nombremin = nombre
    return nombremin

def nombre_alumno(notas_alumnos):
    for nombre, nota in notas_alumnos.items():
        print(f"alumno: {nombre}")

def alumnos_aprobados(notas_alumnos):
    for nombre, nota in notas_alumnos.items():
        if nota >= 7:
            print(f"el alumnos aprobados: {nombre}")


def alumnos_menor_promedio(notas_alumnos):
    for nombre, nota in notas_alumnos.items():
        if nota < promedio(notas_alumnos):
            print(f"alumnos menor al promedio: {nombre}") 




# Ejemplo de uso:
notas_alumnos = {
    "Saturno": 8,
    "Luchito": 6,
    "Isa": 9,
    "Yamil": 5,
    "Aru": 7,
    "Dipa": 8,
    "Alar": 9,
    "Frankito": 6,
    "Behe": 10,
    "Monti": 7
}


aprobados = contar_aprobados(notas_alumnos)
prom = promedio(notas_alumnos)
proma = promedio_aprobados(notas_alumnos)
nmax = nota_max(notas_alumnos)
nmin = nota_min(notas_alumnos)
print("La cantidad de alumnos que aprobaron es: {aprobados}")
print(f"El promedio de las nota de los alumnos es: {prom}")
print(f"Promedio de las notas de los aprobados es: {proma}")
print(f"La nota maxima es: {nmax}")
print(f"La nota minima es: {nmin}")
print(f"el alumnos desaprobados -> ")
alumnos_desaprobados(notas_alumnos) #los parametros no tienen referencia ni valor, tener cuidado en otros lenguajes
print(f"el alumnos con 10 -> ")
alumnos_10(notas_alumnos)
print(f"alumno con menor nota -> ", alumno_nota_min(notas_alumnos))
print(f"nombre de todos los alumnos -> ")
nombre_alumno(notas_alumnos)
print(f"alumnos aprobados -> ")
alumnos_aprobados(notas_alumnos)
print(f"alumnos menor al promedio -> ")
alumnos_menor_promedio(notas_alumnos)
        
