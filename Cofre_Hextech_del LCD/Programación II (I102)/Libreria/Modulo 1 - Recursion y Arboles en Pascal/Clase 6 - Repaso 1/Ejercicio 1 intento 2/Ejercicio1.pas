{
Un sitio de estadísticas deportivas mantiene la información de jugadores del fútbol
* argentino. Para ello, se dispone de los datos de los partidos jugados en el año 2022.
* De cada partido se conoce el estadio donde se jugó, los nombres de los 2 equipos que se
* enfrentaron, la fecha (ej. ‘2022/03/28’) y la información de los jugadores que
* participaron del encuentro. De cada jugador se conoce su nombre y apellido, su DNI,
* posición (arquero, defensa, mediocampo o delantero) y un puntaje otorgado por un crítico
* deportivo (1..10). Esta información no tiene ningún orden específico. 

Se pide: 
a) Crear una nueva estructura que almacene para cada jugador, su DNI, su nombre y
* apellido, posición, y la fecha junto al puntaje obtenido para cada partido del que
* participó. Esta estructura debe estar ordenada por DNI, y debe ser eficiente para la
* búsqueda por dicho criterio. 

Al finalizar el procesamiento de a), elija las estructuras adecuadas para: 
b) Implementar un módulo que informe por pantalla los datos de cada jugador y su puntaje
* total acumulado entre todos los partidos. El listado debe estar ordenado por DNI de
* manera descendente.
c) Implementar un módulo que retorne la cantidad de jugadores cuyo DNI se encuentre
* entre 30.000.000 y 40.000.000.
d) Implementar un módulo que, dado una posición recibida por parámetro, retorne la
* cantidad de jugadores que hay en el sistema con dicha característica.  
e) Implementar un programa principal que utilice los módulos implementados e informe
* lo que corresponda.


ACLARACIÓN!
ASUMO QUE CADA JUGADOR MANTIENE SU POSICION ENTRE PARTIDOS A LO LARGO DE LA TEMPORADA
}

Program ejercicio1;
Uses
     sysutils;
const
     infBusqueda = 30000000;
     supBusqueda = 40000000;
Type
     str10 = string[10];
     jugador = record
              dni: longint;
               nombreApellido: string;
               posicion: str10;
              puntaje: integer;
     end;

     lista = ^nodoLista;
     nodoLista = record
               dato: jugador;
               sig: lista;
     end;

     partido= record
               estadio: string;
               equipoLocal: string;
               equipoVisitante: string;
               fecha: str10;
               jugadores: lista;
     end;

     listaPartidos = ^nodoPartido;
     nodoPartido = record
               dato: partido;
               sig: listaPartidos;
     end;

     //ARBOL DE LISTAS
     tipoPartido = record
          puntaje: integer;
          fecha: str10;
     end;
     
	tipoLista = ^nodoLS;
	nodoLS = record
		dato: tipoPartido;
		sig: tipoLista;
	end;

     tipoJugador = record
          nombreApellido: string;
          posicion: str10;
          puntajeTot: integer;
     end;
     
    arbol =   ^nodoA;
    nodoA =   Record
          DNI: longint; // ORDEN DEL ARBOL
          jugador: tipoJugador;
          lista : tipoLista;
          HI:   arbol;
          HD:   arbol;
    End;

procedure cargarFecha(var s: str10);
var
  dia, mes: integer;
begin
  dia := random(30)+1;
  mes := random(12)+1;
  if(mes = 2) and (dia > 28)then
     dia := 31;
  if((mes = 4) or (mes = 6) or (mes =9) or (mes = 11)) and (dia = 31)then
     dia := 30;
  s := Concat('2022/',IntToStr(mes),'/',IntToStr(dia));
end;

Procedure agregar(var l: listaPartidos; p: partido);
var
   aux: listaPartidos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;

Procedure agregarJugador(var l: lista; j: jugador);
var
   aux: lista;
begin
     new(aux);
     aux^.dato := j;
     aux^.sig := l;
     l:= aux;
end;

procedure cargarJugadores(var l: lista);
var
   j: jugador;
   cant, i, pos: integer;
begin
     cant := random(10)+22;
     for i:=1 to cant do
     begin
          with(j) do begin
              dni := random(36000000)+20000000;
           nombreApellido:= Concat('Jugador-', IntToStr(dni));
           pos:= random(4)+1;
              case pos of
                1: posicion:= 'arquero';
                2: posicion:= 'defensa';
                3: posicion:= 'mediocampo';
                4: posicion:= 'delantero';
              end;
              puntaje:= random(10)+1;
          end;
          agregarJugador(l, j);
     end;
end;

procedure crearLista(var l: listaPartidos);
var
   p: partido;
   cant, i: integer;
begin
     cant := random(10);
     for i:=1 to cant do
     begin
          with(p) do begin
               estadio:= Concat('Estadio-', IntToStr(random (500)+1));
               equipoLocal:= Concat('Equipo-', IntToStr(random (200)+1));
               equipoVisitante:= Concat('Equipo-', IntToStr(random (200)+1));
               cargarFecha(fecha);
               jugadores:= nil;
               cargarJugadores(jugadores);
          end;
          agregar(l, p);
     end;
end;



procedure imprimirJugador(j: jugador);
begin
     with (j) do begin
          writeln('Jugador: ', nombreApellido, ' con dni ',dni, ' en posicion: ', posicion, ' y puntaje: ', puntaje);
     end;
end;

procedure imprimirJugadores(l: lista);
begin
     while (l <> nil) do begin
          imprimirJugador(l^.dato);
          l:= l^.sig;
     end;
end;

procedure imprimir(p: partido);
begin
     with (p) do begin
          writeln('');
          writeln('Partido en el ', estadio, ' entre ',equipoLocal, ' y ', equipoVisitante, ' jugado el: ', fecha, ' por los siguientes jugadores: ');
          imprimirJugadores(jugadores);
     end;
end;

procedure imprimirLista(l: listaPartidos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

// ----------------- NUEVA IMPLEMENTACION -----------------

Procedure agregarFinalLS(Var l: tipoLista; elem: tipoPartido);
        Var act, ant, nue: tipoLista;
        Begin
                new(nue); nue^.dato := elem; nue^.sig := Nil;
                if l = nil then
                        l := nue
                else begin
                        act:= l; ant:= l;
                        while (act <> nil) do begin
                                ant := act; act := act^.sig;
                        end;
                        ant^.sig := nue;
                end;
        End;

procedure insertarPartido(var l: tipoLista; fecha: str10; puntaje: integer);
{
     tipoPartido = record
          puntaje: integer;
          fecha: str10;
     end;
}
     var aux: tipoPartido;
     begin
          aux.fecha:= fecha;
          aux.puntaje:= puntaje;
          agregarFinalLS(l, aux);
     end;


procedure insertarEnRamaArbolDeListas(var a: arbol; elemento: jugador; fecha: str10); // toma un elemento y lo inserta en una rama de un arbol
	begin
		if (a = nil) then begin
					new(a);
                         a^.DNI:= elemento.DNI;
                         a^.jugador.nombreApellido:= elemento.nombreApellido;
                         a^.jugador.posicion:= elemento.posicion;
                         a^.jugador.puntajeTot:= elemento.puntaje;
					a^.lista:= nil;
					insertarPartido(a^.lista, fecha, elemento.puntaje);
					a^.HD:= nil;
					a^.HI:= nil;
		end else
			if (a^.DNI > elemento.DNI) then
						insertarEnRamaArbolDeListas(a^.HI, elemento, fecha)
			else if (a^.DNI < elemento.DNI) then
					insertarEnRamaArbolDeListas(a^.HD, elemento, fecha)
				else begin
                         insertarPartido(a^.lista, fecha, elemento.puntaje);
                         a^.jugador.puntajeTot:= a^.jugador.puntajeTot + elemento.puntaje;
                    end;
	end;

procedure cargarArbol(l: listaPartidos; var a: arbol);
{    jugador = record
              dni: longint;
               nombreApellido: string;
               posicion: str10;
              puntaje: integer;
     end;

     lista = ^nodoLista;
     nodoLista = record
               dato: jugador;
               sig: lista;
     end;
}
{    partido= record
               estadio: string;
               equipoLocal: string;
               equipoVisitante: string;
               fecha: str10;
               jugadores: lista;
     end;

     listaPartidos = ^nodoPartido;
     nodoPartido = record
               dato: partido;
               sig: listaPartidos;
     end;
}
     var
          auxP: listaPartidos;
          auxJ: lista;
     begin
          auxP:= l;
          while (auxP<>nil) do begin
               auxJ:= auxP^.dato.jugadores;
               while (auxJ<>nil) do begin
                    insertarEnRamaArbolDeListas(a,auxJ^.dato, auxP^.dato.fecha);
                    auxJ:= auxJ^.sig;
               end;
               auxP:= auxP^.sig;
          end;
     end;

procedure imprimirRamaLS(a: arbol); // INVOCAR DENTRO DEL RECORRIDO PREORDEN, ENORDEN O POSTORDEN
   var
   	  aux: tipoLista;
	  cont: integer;
   begin
		cont:= 1;
		with a^ do begin
               writeln;
			writeln(' Jugador de DNI :', DNI);
			writeln(' -- Nombre y Apellido: ', jugador.nombreApellido);
               writeln(' -- Posicion: ', jugador.posicion);
               writeln(' -- Puntaje Total: ', jugador.puntajeTot);
               aux:= lista;
			while (aux <> nil) do begin
				with aux^.dato do begin
					write(' --- Partido ', cont, ':');
					write(' ---- Puntaje: ', aux^.dato.puntaje);
                         write(' ---- Fecha: ', aux^.dato.fecha);
                         writeln;
				end;
				cont:= cont + 1;
				aux:= aux^.sig;
			end;
		end;
   end;


procedure imprimirPorJugador(a: arbol);
   begin
     // DE MAYOR A MENOR
     if (a <> nil) then begin
          imprimirPorJugador(a^.HD);
          imprimirRamaLS(a);
          imprimirPorJugador(a^.HI);
     end;
   end;

function busquedaAcotadaArbol(a: arbol; inf, sup: longint): integer; 
   begin
     if (a <> nil) then
          if (a^.dni >= inf) then
               if (a^.dni <= sup) then begin
                    busquedaAcotadaArbol:= busquedaAcotadaArbol(a^.hi, inf, sup) + busquedaAcotadaArbol(a^.hd, inf, sup) + 1;
               end
               else
                    busquedaAcotadaArbol:= busquedaAcotadaArbol(a^.hi, inf, sup)
          else
               busquedaAcotadaArbol:= busquedaAcotadaArbol(a^.hd, inf, sup)
     else busquedaAcotadaArbol:=0;
   end;

function buscarCantJugadoresEnPos(a: arbol; pos: str10): integer;
     begin
          if (a = nil) then buscarCantJugadoresEnPos:=0
               else begin
                    if (a^.jugador.posicion = pos) then
                         buscarCantJugadoresEnPos:= buscarCantJugadoresEnPos(a^.HI, pos) + buscarCantJugadoresEnPos(a^.HD, pos) + 1
                    else buscarCantJugadoresEnPos:= buscarCantJugadoresEnPos(a^.HI, pos) + buscarCantJugadoresEnPos(a^.HD, pos);
               end;
     end;

procedure cuantosJugadoresHayEnPos(a: arbol);
     var
          pos: integer;
          posicion: str10;
     begin
          if (a = nil) then writeln('ERROR - estructura no cargada')
               else begin
                    writeln('Ingrese la posicion: 1)ARQUERO, 2)DEFENSA, 3)MEDIOCAMPO, 4)DELANTERO');
                    readln(pos);
                    while not(pos in [1..4]) do readln(pos);
                    case pos of
                         1: posicion:= 'arquero';
                         2: posicion:= 'defensa';
                         3: posicion:= 'mediocampo';
                         4: posicion:= 'delantero';
                    end;
                    writeln('La cantidad de jugadores que hay en la posicion "', posicion, '" es: ', buscarCantJugadoresEnPos(a, posicion));
               end;
     end;


Procedure liberarMem(Var l: listaPartidos);
   Var aux:   listaPartidos;
   Begin
       While (l<>Nil) Do
           Begin
               aux := l;
               l := l^.sig;
               dispose(aux);
           End;
   End;

var
   l: listaPartidos;
   a: arbol;
begin
     Randomize;

     l:= nil;
     crearLista(l); {carga automática de la estructura disponible}
     writeln ('Lista generada: ');
     imprimirLista(l);

     {Completar el programa}
     // Inciso A
     a:=nil;
     cargarArbol(l, a);

     // Inciso B
     imprimirPorJugador(a);

     // Inciso C
     if (a=nil) then writeln('Error - arbol no cargado')
               else writeln('Cantidad de jugadores con DNI entre ', infBusqueda, ' y ', supBusqueda, ' es: ', busquedaAcotadaArbol(a, infBusqueda, supBusqueda));

     // Inciso D
     cuantosJugadoresHayEnPos(a);

     writeln('Fin del programa');
     readln;
     liberarMem(l);
end.
