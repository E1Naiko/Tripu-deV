{
        *8.- a) Se lee una secuencia de caracteres que termina cuando se procesa el carácter número 500
    o se ingresa el carácter 'z', el cual debe procesarse. Determinar la cantidad de palabras que
    componen la secuencia.
        b) Ídem a), pero calculando la cantidad de palabras que comienzan con ‘R’.
        c) Ídem a) y b), pero calculando la cantidad de palabras que terminan con ‘T’.
        d) Ídem a) a c), pero calculando la cantidad de palabras que comienzan con ‘R’ y terminan con
    ‘N’.
        e) Ídem a) a d), pero calculando la cantidad de palabras que tienen menos de 6 caracteres y
    exactamente dos ‘p‘.
    (Recomendamos pasar por máquina y consultar a los ayudantes)
}
program tp2Ej8Intento2;
//uses crt, SysUtils;
const
    menosDe=6; cant_p=2; termina='z'; cantTotal=500;
//procedure
var
    // anterior para guardar posible ultimo caracter, y actual para el lector de caracteres
    ant, act: char;

    // contadores
    contGeneral, contPalabras {EjA}, comienzanR, {EjB} terminanT {EjC}, 
    comienzanR_N {EjD}, menosSeisDosP,  contCar, contP {EjE} : integer;
  
    // condicion booleana para usar en el ej d y no guardar todos los primeros caracteres
    condComienzaR: boolean;
    
begin
    // Inicializo variables
    contGeneral:= 0; contPalabras:= 0; comienzanR:= 0; terminanT:= 0;
    comienzanR_N:= 0; menosSeisDosP:= 0; contCar:= 0; contP:= 0;
    ant:=' '; act:=' ';
    
    // Prog Ppal.
    writeln(' --- Introduzca una secuencia de caracteres: ');
                                                                                
    repeat begin
        ant:=act; read(act);
        // actualizo al final de la palabra o al principio de la secuencia
        condComienzaR:=false; contP:=0;
        
        // interpreto que el blank no es un caracter y me los salteo
        while (act=' ') do read(act);
        
        // SI O SI me encuentro al prinicipio de una palabra
        if (act='R') then begin
            comienzanR:=comienzanR+1;                                           // actualizo contador del EjB
            condComienzaR:=true;
        end;
        
        contPalabras:=contPalabras+1;
        
        // recorro el interior de la palabra
        while (act<>' ') and (act<>termina) and (contGeneral<cantTotal) do begin
            contGeneral:=contGeneral+1;
            contCar:=contCar+1;
            if (act='p') then contP:=contP+1;           
            ant:=act; read(act);
        end;
        
        // SI O SI estoy al final de una palabra
        if (ant='T') then terminanT:= terminanT+1;                              // actualizo contador del EjB
        if (contCar<menosDe) and (contP=cant_p) then
            menosSeisDosP:= menosSeisDosP+1;                                    // actualizo contador del EjE
        if (condComienzaR) and (ant='N') then
            comienzanR_N:= comienzanR_N+1;                                       // actualizo contador del EjD
        
    end until (contGeneral=cantTotal) or (act=termina);
    
    // informo
    writeln(' - Palabras totales: ',contPalabras);
    writeln(' - Palabras que comienzan con ‘R‘: ',comienzanR);
    writeln(' - Palabras que terminan con ‘T‘: ',terminanT);
    writeln(' - Palabras que comienzan con R y terminan con ‘N‘: ',comienzanR_N);
    writeln(' - Palabras que tienen menos de 6 caracteres y exactamente dos ‘p‘: ',menosSeisDosP);
end.
