{
   9. * Escriba un programa que lea una secuencia de caracteres terminada en punto, y que a través de
un procedimiento evalúe si cada una de sus palabras tiene la 'p' seguida de la ‘a’. El programa debe
informar cuántas palabras cumplen con esa condición.
   
}


program Tp3Ej9;
const
	termina='.';
	
// Modulos
procedure recorrerPalabra(var ant,act: char; var encontre_pa:boolean);
	begin
		while (act<>' ') and (act<>termina) do begin
            if (ant='p') and (act='a') then encontre_pa:=true;          
            ant:=act; read(act);
        end;
	end;
	
// Prog Ppal
var
    // anterior para guardar posible ultimo caracter, y actual para el lector de caracteres
    ant, act: char;

    // contadores
    contPalabras_pa: integer;
    
    // condicion encontre p seguido por a en la palabra
    encontre: boolean;
begin
    // Inicializo variables
    contPalabras_pa:= 0;
    ant:=' '; act:=' ';
    
    // Main
    
    writeln(' --- Introduzca una secuencia de caracteres terminado por un ´.´: ');
                                                                                
    repeat begin
        encontre:=false; ant:=act; read(act);
        
        // interpreto que el blank no es un caracter y me los salteo
        while (act=' ') do read(act);
        
        // SI O SI me encuentro al prinicipio de una palabra 
        
        // recorro el interior de la palabra
        recorrerPalabra(ant, act, encontre);
        if (encontre) then contPalabras_pa:=contPalabras_pa+1;
        
        // SI O SI estoy al final de una palabra
        
    end until (act=termina);
    
    // informo
    writeln(' - Palabras totales con p seguida por a: ',contPalabras_pa);
    readln();
end.
