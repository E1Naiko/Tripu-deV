{

        *5- Realizar un programa que lea información sobre el volumen en centímetros cúbicos (cm3) de 12
    botellas de diferentes bebidas gasificadas. Informar las 2 botellas con menor volumen y las 2 con
    mayor volumen. Además, se desea saber el promedio de volumen y el porcentaje de botellas cuyo
    valor superó los 2000 cm3.


}
program Tp1Ej5;
uses crt;
const
    constSuperar = 2000; // se desea saber el promedio de volumen y el porcentaje de botellas cuyo valor superó los 2000 cm3
    totalBotellas = 12; // lo pongo como constante cosa que si quiero poner mas o menos botellas solo cambio esto
    
var
    ok: boolean; // para hacer un corte de control en la lectura, no hace falta pero es MUY buena costumbre
    botella : integer; // lectura
    volumen,           // lectura
    menorUno, menorDos, mayorUno, mayorDos, // Informar las 2 botellas con menor volumen y las 2 con mayor volumen
    promedio, porcentaje: real; // se desea saber el promedio de volumen y el porcentaje de botellas cuyo valor superó los 2000 cm3
    
begin
    // -------------------- Inicializo --------------------
    menorUno:=9998; menorDos:=9999; // los inicializo lo mas alto posible para tener una base para comparar
    mayorUno:=0; mayorDos:=0;        // Lo mismo pero al revez
    promedio:=0; porcentaje:=0;     // estos si los inicializo en 0 para poder contar
    clrscr; // ESTO NO LO PIDEN
    
    // -------------------- Prog Ppal --------------------
    for botella:=1 to totalBotellas do begin
        ok:=false;
        
        // ---------- PARTE 1 ----------
        // esta estructura es un corte de control que deja pasar una variable SOLO SI VOLUMEN>0
        // en el tp1 no lo piden pero a futuro si
        repeat begin
            writeln('Introduzca el volumen de la botella numero ', botella, '/', totalBotellas);
            readln(volumen);
            if (volumen>0) then ok:=true
                else writeln('ERROR');
        end until (ok);
        
        // ---------- PARTE 2 ----------
        // actualizo mayores
        if (volumen>mayorUno) then begin
            mayorDos:= mayorUno;
            mayorUno:= volumen;
        end else
            if (volumen>mayorDos) then mayorDos:= volumen;
            
        // actualizo menores
        if (volumen<menorUno) then begin
            menorDos:= menorUno;
            menorUno:= volumen;
        end else
            if (volumen<menorDos) then menorDos:= volumen;
            
        // ---------- PARTE 3 ----------
        
        // primer parte del calculo del promedio, sumo todos los volumenes
        promedio:=promedio+volumen; 
        
        // primer parte del porcentaje, igual que promedio pero si el volumen pasa los 2000 cm3 los sumo al total
        if (volumen>constSuperar) then porcentaje:= porcentaje + 1;
    end;
    
    // ultima parte del calculo del promedio, a la suma de todos los volumenes los divido por la cantidad de volumenes que encontre
    promedio:= promedio / totalBotellas;
    // ultima parte del calculo del procentaje, multiplico la suma de los volumenes por 100 y lo divido en la cant
    // de botellas totales que conte
    porcentaje:= (porcentaje * 100) / totalBotellas;
    //clrscr; // ESTO NO LO PIDEN
    
    // informo, los pongo todos con if para asegurarme de imprimir solo si se encuentran valores
    {if (mayorUno>0) then} writeln('El valor mayor encontrado fue ', mayorUno:2:2);
    {if (mayorDos>0) then} writeln('El segundo valor mayor encontrado fue ', mayorDos:2:2);
    {if (menorUno>9998) then} writeln('El valor menor encontrado fue ', menorUno:2:2);
    {if (menorDos>9998) then} writeln('El segundo menor encontrado fue ', menorDos:2:2);
    {if (promedio>0) then} writeln('Promedio de volumen: ', promedio:2:2, ' cm3');
    {if (porcentaje>0) then }writeln('Porcentaje de botellas que pasaron los ', constSuperar, ' : ', porcentaje:2:2, '%');
end.

