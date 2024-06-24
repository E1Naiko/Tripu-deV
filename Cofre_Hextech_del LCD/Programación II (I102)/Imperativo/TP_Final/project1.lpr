{Un sitio de estadísticas deportivas mantiene la información de jugadores del fútbol argentino. Para ello, se dispone de los datos de los partidos jugados
en el año 2022. De cada partido se conoce el estadio donde se jugó, los nombres de los 2 equipos que se enfrentaron, la fecha (ej. ‘2022/03/28’)
y la información de los jugadores que participaron del encuentro. De cada jugador se conoce su nombre y apellido, su DNI, posición
(arquero, defensa, mediocampo o delantero) y un puntaje otorgado por un crítico deportivo (1..10). Esta información no tiene ningún orden específico. 
Se pide: 
a) Crear una nueva estructura que almacene para cada jugador, su DNI, su nombre y apellido, posición, y la fecha junto al puntaje obtenido
para cada partido del que participó. Esta estructura debe estar ordenada por DNI, y debe ser eficiente para la búsqueda por dicho criterio. 
Al finalizar el procesamiento de a), elija las estructuras adecuadas para:
b) Implementar un módulo que informe por pantalla los datos de cada jugador y su puntaje total acumulado entre todos los partidos.
El listado debe estar ordenado por DNI de manera descendente.
c) Implementar un módulo que retorne la cantidad de jugadores cuyo DNI se encuentre entre 30.000.000 y 40.000.000.
d) Implementar un módulo que, dado una posición recibida por parámetro, retorne la cantidad de jugadores que hay en el sistema con dicha característica.  
e) Implementar un programa principal que utilice los módulos implementados e informe lo que corresponda.
}
Program project1;
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

     //Punto a)
     listapar = ^nodopar;
     nodopar = record
             puntaje: integer;
             fecha: str10;
             sig: listapar;
     end;
     arboljugador = ^nodo;
     nodo = record
          dni: longint;
          nombre: string;
          posicion: str10;
          partidos: listapar;
          totpuntaje: integer;
          HI,HD: arboljugador;

     end;

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
              dni := random(10);{+20000000;}
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

procedure AgregarAdelante (var l: listapar; puntaje:integer; f:str10);
var
   aux: listapar;
begin
     new(aux);
     aux^.puntaje := puntaje;
     aux^.fecha:= f;
     aux^.sig := l;
     l:= aux;
end;

procedure agregarnodo( var a:arboljugador; p:partido; j:jugador);
begin
     if (a = nil) then begin
        new(a);
        a^.dni:= j.dni;
        a^.nombre:= j.nombreApellido;
        a^.posicion:= j.posicion;
        a^.partidos := nil;
        a^.totpuntaje := 0;
	agregarAdelante(a^.partidos,j.puntaje,p.fecha);
	a^.HD:= nil;
	a^.HI:= nil;
	end else
	    if (a^.dni > j.dni) then
	       agregarnodo(a^.HI,p,j)
	       else if (a^.dni < j.dni) then
	            agregarnodo(a^.HD,p,j)
		    else begin
		    agregarAdelante(a^.partidos,j.puntaje,p.fecha);
		    a^.totpuntaje:= a^.totpuntaje + j.puntaje;
		    end;
end;

procedure Crearbol (var a:arboljugador; l:listapartidos);
var
   jugador: lista;
begin
        while (l <> nil) do begin
              jugador:= l^.dato.jugadores;
              while (jugador <> nil) do begin
                  agregarnodo(a,l^.dato,jugador^.dato);
                  jugador:= jugador^.sig;
              end;
              l:= l^.sig;
        end;
end;

procedure imprimirlista(l:listapar);
begin
     while(l<>nil) do begin
        write(' Para la fecha: ',l^.fecha,' tiene: ',l^.puntaje,' | ');
        l:= l^.sig;
     end;
end;

procedure imprimirnodoarbol (a:arboljugador; l:listapar);
   begin
        writeln( 'DNI Jugador: ',a^.dni);
        writeln( 'Nombre Jugador: ',a^.nombre, ' Posicion: ',a^.posicion);
        writeln(' Puntajes: ');
        imprimirlista(l);
        writeln(' Puntaje total: ',a^.totpuntaje);

   end;

procedure imprimirarbol (a:arboljugador);
begin
     if(a <> nil) then begin
     imprimirarbol(a^.HD);
     imprimirnodoarbol(a,a^.partidos);
     imprimirarbol(a^.HI);
     end;
end;

function busqueda (a:arboljugador; inf,sup:longint):integer;
var
   bus: integer;
begin
     bus:= 0;
     if (a <> nil) then
        if (a^.dni >= inf) then
           if (a^.dni <= sup) then begin
              bus:= bus + 1;
              busqueda(a^.hi, inf, sup);
              busqueda(a^.hd, inf, sup);
              end
           else
              busqueda(a^.hi, inf, sup)
        else
           busqueda(a^.hd, inf, sup);
     busqueda:= bus;
   end;

function contarjugador (a:arboljugador; pos:str10):integer;
   begin
        if(a<>nil) then
             if(a^.posicion = pos) then
                  contarjugador:= contarjugador(a^.HI,pos) + contarjugador(a^.HD,pos) + 1
                  else
                    contarjugador:= contarjugador(a^.HI,pos) + contarjugador(a^.HD,pos)
        else
        contarjugador:= 0;
   end;

var
   l: listaPartidos;
   a: arboljugador;
   pos: str10;
begin
     Randomize;
     a:= nil;
     l:= nil;
     crearLista(l); {carga automática de la estructura disponible}
     writeln ('Lista generada: ');
     imprimirLista(l);
     crearbol(a,l);
     writeln('---------------------------');
     writeln(' Arbol generado ');
     imprimirarbol(a);
     writeln('----------------------------------');
     writeln('Cantidad de Jugadores con DNI entre 30000000 y 40000000: ',busqueda(a,3,6),' Jugadores');
     writeln('----------------------------------');
     writeln(' Posicion que queres saber cuanto jugadores tiene: ');
     readln(pos);
     writeln('----------------------------------');
     writeln(' La posicion: ',pos, ' tiene: ', contarjugador(a,pos),' jugadores');

     {Completar el programa}

     writeln('Fin del programa');
     readln;
end.

