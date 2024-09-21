{
 Un sitio de estadísticas deportivas mantiene la información de jugadores del
 * fútbol argentino. Para ello, se dispone de los datos de los partidos jugados en
* el año 2022. De cada partido se conoce el estadio donde se jugó, los nombres de
* los 2 equipos que se enfrentaron, la fecha (ej. ‘2022/03/28’) y la información
* de los jugadores que participaron del encuentro. De cada jugador se conoce su
* nombre y apellido, su DNI, posición (arquero, defensa, mediocampo o delantero)
* y un puntaje otorgado por un crítico deportivo (1..10). Esta información no
* tiene ningún orden específico. 

Se pide: 
a) Crear una nueva estructura que almacene para cada jugador, su DNI, su nombre
* y apellido, posición, y la fecha junto al puntaje obtenido para cada partido
* del que participó. Esta estructura debe estar ordenada por DNI, y debe ser
* eficiente para la búsqueda por dicho criterio. /*º*/

Al finalizar el procesamiento de a), elija las estructuras adecuadas para:
b) Implementar un módulo que informe por pantalla los datos de cada jugador y
* su puntaje total acumulado entre todos los partidos. El listado debe estar
* ordenado por DNI de manera descendente.

c) Implementar un módulo que retorne la cantidad de jugadores cuyo DNI se
* encuentre entre 30.000.000 y 40.000.000.
d) Implementar un módulo que, dado una posición recibida por parámetro, retorne
* la cantidad de jugadores que hay en el sistema con dicha característica.  
e) Implementar un programa principal que utilice los módulos implementados e
* informe lo que corresponda.

Código fuente disponible en Ejercicio1.pas


}
Program Ejercicio1;
Uses
     sysutils;
Type
     str10= string[10];
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


	// PARA NUEVA ESTRUCTURA (ARBOL)
    tipoPartidosPorJugador = record
			  posicion: str10;
              puntaje: integer;
              fecha: str10;
    end;

    listaPartidosJugador = ^nodoPartidos;
    nodoPartidos = record
              dato: tipoPartidosPorJugador;
              sig: listaPartidosJugador;
    end;

    arbol =   ^nodoA; // DEBE ESTAR ORDENADA POR DNI
    nodoA =   Record
        DNI: LongInt;
        nombreApellido: string;
        lista: listaPartidosJugador;
        puntajeTot: integer;
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



procedure agregarAdelante(var l: listaPartidosJugador; elemento: jugador);
          var
			 aux: tipoPartidosPorJugador;
             nue, ant, act: listaPartidosJugador;
          begin
			aux.posicion:= elemento.posicion;
            new(nue); nue^.dato:= aux; nue^.sig:= nil;
            if (l=nil) then l:= nue
               else begin
                  act:= l; ant:= l;
                  while (act <> nil) do begin
                      ant:= act;
                      act:=act^.sig;
                  end;
                  ant^.sig:= nue;
                  act:= nue;
               end;
          end;


procedure insertarEnRamaArbolDeListas(var a: arbol; elemento: jugador; fecha: str10); // toma un elemento y lo inserta en una rama de un arbol
	begin
		if (a = nil) then begin
					new(a);
                                        a^.DNI:= elemento.DNI;
                                        a^.puntajeTot:=elemento.puntaje;
					a^.lista:= nil;
					agregarAdelante(a^.lista, elemento);
					a^.HD:= nil;
					a^.HI:= nil;
		end else
			if (a^.DNI > elemento.DNI) then
						insertarEnRamaArbolDeListas(a^.HI, elemento, fecha)
			else if (a^.DNI < elemento.DNI) then begin
					insertarEnRamaArbolDeListas(a^.HD, elemento, fecha)
				end else begin
                          a^.puntajeTot:= a^.puntajeTot + elemento.puntaje;
                          agregarAdelante(a^.lista, elemento);
                     end;
        end;

procedure cargarArbol(l: listaPartidos; var a: arbol);
        var
           aux1: listaPartidos;
           aux2: lista;
        begin
          aux1:= l;
          while (aux1<>nil) do begin
              aux2:= aux1^.dato.jugadores;
              while (aux2 <> nil) do begin
                    insertarEnRamaArbolDeListas(a,aux2^.dato, aux1^.dato.fecha);
                    aux2:= aux2^.sig;
              end;
            aux1:= aux1^.sig;
          end;
        end;



procedure imprimirDatos(a:arbol);
var
	aux: listaPartidosJugador;
	cont: integer;
begin
	cont:= 1;
	with a^ do begin
		writeln(' DNI :', DNI);
		writeln(' -- Nombre: ', nombreApellido);
		aux:= a^.lista;
		while (aux <> nil) do begin
			with aux^.dato do begin
				writeln(' -- Partido N ', cont, ':');
				writeln(' ---- Posicion: ', posicion);
				writeln(' ---- Puntaje: ', puntaje);
				writeln(' ---- Fecha: ', fecha);
			end;
			cont:= cont+1;
			aux:= aux^.sig;
		end;
		writeln(' -- Puntaje total: ', puntajeTot);
	end;
end;



procedure postOrden(a: arbol);
begin
     if (a<>nil) then begin
       postOrden(a^.HD);
       imprimirDatos(a);
       postOrden(a^.HI);
     end;
end;



Procedure busquedaAcotadaArbol(a: arbol; inf:integer; sup:integer);
        begin
          if (a <> nil) then
            if (a^.DNI >= inf) then
              if (a^.DNI <= sup) then begin
                // imprimir
                busquedaAcotadaArbol(a^.hi, inf, sup);
                busquedaAcotadaArbol(a^.hd, inf, sup);
              end
              else
                busquedaAcotadaArbol(a^.hi, inf, sup)
            else
              busquedaAcotadaArbol(a^.hd, inf, sup);
        end;



Procedure liberarMemPartidos(Var l: lista);
Var aux:   lista;
Begin
    While (l<>Nil) Do
        Begin
            aux := l;
            l := l^.sig;
            dispose(aux);
        End;
End;

Procedure liberarMemJugadores(Var l: lista);

Var aux:   lista;
Begin
    While (l<>Nil) Do
        Begin
            aux := l;
            l := l^.sig;
            dispose(aux);
        End;
End;


Procedure liberarMemPartidos(Var l: listaPartidos);

Var aux:   listaPartidos;
Begin
    While (l<>Nil) Do
        Begin
            aux := l;
            liberarMemJugadores(l^.dato.jugadores);
            l := l^.sig;
            dispose(aux);
        End;
End;
Procedure liberarMemArbol(Var Al: arbol);
    // GENERADO POR CHAT GPT

    Var
		aux:   arbol;
		aux2: listaPartidosJugador;
    Begin
        If (Al <> Nil) Then
            Begin
                LiberarMemArbol(Al^.HI);
                // Liberar subárbol izquierdo
                LiberarMemArbol(Al^.HD);
                // Liberar subárbol derecho
                aux := al;
                while al^.lista<>nil do begin
					aux2:= al^.lista;
					al^.lista:=al^.lista^.sig;
					dispose(aux2);
                end;
                dispose(aux);
                // Liberar nodo actual
                al := Nil;
                // Asignar nil a la raíz para indicar que el árbol está vacío
            End;
    End;




var
   l: listaPartidos;
   a: arbol;

begin
     Randomize;

     l:= nil;
     a:= nil;
     crearLista(l); {carga automática de la estructura disponible}
     writeln ('Lista generada: ');
     imprimirLista(l);

     {Completar el programa}
     writeln('Nueva estructura: ');
     cargarArbol(l,a);
     imprimirDatos(a);

     writeln('Fin del programa');
     readln;
     liberarMemPartidos(l);
     liberarMemArbol(a);
end.

