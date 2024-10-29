# SON TODOS PUTOS

n = int (input("Ingrese un numero entero: "))
i = int(1) # contador
j = int(0)
signo = int(1)

while (i<=n):
    j=0
    signo *= -1
    
    while (j<2):
        j+=1
        print(f"{signo*i}/{5**(i-1)}")
        i +=1
