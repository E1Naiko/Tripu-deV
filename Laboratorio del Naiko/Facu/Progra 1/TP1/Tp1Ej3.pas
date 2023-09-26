{

        *3- Realizar un programa que lea por teclado la cantidad de ciudades de cada uno de los 135 partidos
    de la provincia de Buenos Aires. Además, por cada ciudad debe leer la cantidad de habitantes.
    Adicionalmente, se pide:
    
        a) Informar la cantidad promedio de habitantes por partido.
        b) Modificar el inciso a) agregando las instrucciones necesarias para informar el menor y mayor
    número de habitantes promedio de los partidos.
        c) Modificar b) para que además se informe el porcentaje de partidos cuyo valor promedio de
    habitantes superó los 20.000.
        d) Modificar a) para que en lugar de leerse desde teclado la cantidad de ciudades de cada
    partido, la condición dependa de que la cantidad de habitantes de cada ciudad sea mayor
    que 0.
    
}
program Tp1Ej3;
uses crt;
const
    fin=0; // condicion final para ejecicio d
    totalPartidos=2; // cantidad de partidos total, dada por el ej
    constSupero=20000;
var
    partido, habitantes {lectura}, cantCiudades {EjD}: integer; // voy a hacer directamente desde el d
    promedio {EjA}, menorProm, mayorProm {EjB}, supero {EjD}: real;
begin
    // Inicializo
    menorProm:=9999; mayorProm:=-1; supero:=0;
    clrscr;
    
    // Prog Ppal
    for partido:=1 to totalPartidos do begin
        promedio:=0; cantCiudades:=0;
        writeln('Ingrese la cantidad de habitantes de la ciudad numero ',cantCiudades); read(habitantes);
        
        // proceso todas las ciudades como lo indica el EjD
        While (habitantes<>fin) do begin
            promedio:= promedio+habitantes; // actualizo el valor de promedio
            cantCiudades:= cantCiudades+1;
            writeln('Ingrese la cantidad de habitantes de la ciudad numero ',cantCiudades); read(habitantes);
        end;
        
        // no lo pide el ejecicio de esta forma, pero tampoco esta de mas, basicamente en caso de no leer nada Informo
        // caso contrario comparo y actualizo el ejb e Informo
        if (promedio=0) then writeln('El partido ', partido,' no tiene habitantes.')
            else begin
                promedio:= promedio / cantCiudades;
                if (promedio<menorProm) then menorProm:= promedio;
                if (promedio>mayorProm) then mayorProm:= promedio;
                if (promedio>constSupero) then supero:=supero+1;
                writeln('Promedio de habitantes encontrado en el partido numero ', partido,': ', promedio:2:2);
            end;
    end;
    // calculo EjC
    supero:=(supero/totalPartidos) * 100;
    
    clrscr;
    // Informo
    if (menorProm=0) then writeln('ERROR - MENOR PROMEDIO NO ENCONTRADO')
        else writeln('Menor promedio encontrado ', menorProm:2:2);
    if (mayorProm=0) then writeln('ERROR - MAYOR PROMEDIO NO ENCONTRADO')
        else writeln('Mayor promedio encontrado ', mayorProm:2:2);
    writeln(supero:2:2,'% de los partidos paso los 20.000 habitantes promedio.');
end.

