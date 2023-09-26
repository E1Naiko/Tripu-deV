{

*2- Realizar un programa que lea por teclado valores que representan la cantidad de animales que
ingresaron en cada una de las 24 horas de un día en una clínica veterinaria. Se pide:
a) Informar la máxima cantidad de animales que entraron en una hora.
b) Agregar al inciso a) el código necesario para informar la hora en que más animales entraron.

}
program Tp1Ej2;
uses crt; // no lo pide el ejercicio, es para facilitar lectura
const
    error=-1; // caso que no se lea nada
    horaTotal=23; // cantidad de horas totales que abre la veterinaria
var
    animales, horas {LECUTURA DE ANIMALES POR HORA}, maxAnimales {EjA}, maxHora {EjB}: integer;
begin
    // INICIALIZO
    maxAnimales:=error; maxHora:=error;
    clrscr;
    
    // PROG PPAL
    for horas:=0 to horaTotal do begin
        writeln('Introduzca la cantidad de animales que ingreso a las ', horas,' horas: ');
        readln(animales);
        if (animales>maxAnimales) then begin
            maxAnimales:= animales;
            maxHora:=horas;
        end;
        clrscr;
    end;
    clrscr;
    
    // INFORMO
    if (maxAnimales=error) then writeln('ERROR')
        else writeln(' - La mayor cantidad de animales entro a las ', maxHora, ' horas y fue de ', maxAnimales,' animales.');
end.

