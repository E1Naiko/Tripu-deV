{La empresa “Veterinaria Paws” desea procesar la información de las mascotas que atienden. De cada mascota se
conoce: identificador, tipo de animal (perro, gato, etc.), peso, fecha de ingreso a la veterinaria, cantidad de
intervenciones. Además se conoce información de su dueño: DNI, nombre y apellido y dirección. Esta información se
lee desde teclado sin ningún orden específico hasta que alcance a la mascota que tiene al dueño con DNI 90909090.
}

program ExamenPascal2;
const
     FINDNI = 90909090;
     INF = 15000000;
     SUP = 30000000;
type
     fecha= record
             dia: integer;
             mes: integer;
             anho: integer;
     end;

     persona = record
             dni: integer;
             nombreApellido: string;
             direccion: string;
     end;

     mascota = record
             identificador: integer;
             tipoAnimal: string;
             peso: real;
             fechaIngreso: fecha;
             cantInterveciones: integer;
             dueno: persona;
     end;

     mascotaDisposicion = record
             identificador: integer;
             tipo: string;
             peso: real;
             fechaIngreso: fecha;
             cantIntervecion: integer;

     end;

     listaMascotas = ^nodo;
     nodo= record
             dato: mascotaDisposicion;
             sig: listaMascotas;
     end;

     cliente= record
             dni: integer;
             nombreApellido: string;
             direccion: string;
             mascotas: listaMascotas;
     end;

     arbolCliente = ^nodoArbol;
     nodoArbol = record
             dato: cliente;
             HI,HD: arbolCliente;
     end;

{a) Realizar un módulo que procese la información descripta anteriormente y genere una estructura donde para
cada cliente se guarde su DNI, nombre y apellido, dirección y las mascotas que tiene a su cargo. De cada
mascota interesa almacenar el identificador de la mascota, el tipo de animal, peso, fecha de ingreso a la
veterinaria y cantidad de intervenciones. Esta estructura debe estar ordenada por DNI del cliente y debe ser
eficiente para la búsqueda por dicho criterio.  }

procedure CargarDueno(var p:persona);
begin
     writeln('DNI: ');
     readln(p.dni);
     if (p.dni <> FINDNI) then begin
        writeln('Nombre y Apellido: ');
        readln(p.nombreApellido);
        writeln('Direccion: ');
        readln(p.direccion);
     end;
end;

procedure CargarFecha (var f:fecha);
begin
     readln(f.dia);
     write('/');
     read(f.mes);
     write('/');
     read(f.anho);
end;

procedure CargarMascotas (var m:mascota);
var
   p:persona;
   f:fecha;
begin
     with m do begin
       writeln('Datos del Dueno');
       CargarDueno(p);
       while ( p.dni <> FINDNI) do begin
             writeln('Identificador Mascota: ');
             readln(identificador);
             writeln('Tipo de animal ');
             readln(tipoAnimal);
             writeln('Peso ');
             readln(peso);
             writeln('Fecha de Ingreso');
             CargarFecha(f);
             writeln('Cantidad de Interveciones: ');
             readln(cantInterveciones);
             writeln(' Datos de otra mascota: ');
             CargarDueno(p);
       end;
     end;
end;

procedure AgregarAdelante (var l:listaMascotas; m:mascota);
var
   nue:listaMascotas;
begin
     new(nue);
     nue^.dato.identificador:= m.identificador;
     nue^.dato.tipo:= m.tipoAnimal;
     nue^.dato.peso:= m.peso;
     nue^.dato.fechaIngreso:= m.fechaIngreso;
     nue^.dato.cantIntervecion:= m.cantInterveciones;
     nue^.sig:= l;
     l:= nue;
end;

procedure InsertarNodo (var a:arbolCliente; m:mascota);
begin
     if (a<>nil) then begin
        new(a);
        a^.dato.dni:= m.dueno.dni;
        a^.dato.nombreApellido:= m.dueno.nombreApellido;
        a^.dato.direccion:= m.dueno.direccion;
        a^.dato.mascotas:= nil;
        AgregarAdelante(a^.dato.mascotas,m);
        a^.HD:= nil;
        a^.HI:= nil;
     end else
        if (a^.dato.dni > m.dueno.dni) then
	    InsertarNodo(a^.HI, m)
	else if (a^.dato.dni < m.dueno.dni) then
	         InsertarNodo(a^.HD, m)
	     else begin
                  AgregarAdelante(a^.dato.mascotas,m);
             end;
end;

procedure CrearArbol(var a:arbolCliente);
var
   m: mascota;
begin
     CargarMascotas(m);
     while (m.dueno.dni <> FINDNI) do begin
           InsertarNodo(a,m);
           CargarMascotas(m);
     end;
end;

{b) Implementar un módulo que informe el domicilio del cliente que tiene la menor cantidad de intervenciones
entre todas sus mascotas.}

procedure Minimo (c:cliente; var cant:integer; var min:string);
begin
     while (c.mascotas <> nil ) do begin
          if (cant < c.mascotas^.dato.cantIntervecion) then begin
             cant:= c.mascotas^.dato.cantIntervecion;
             min:= c.direccion;
          end;
          c.mascotas:= c.mascotas^.sig
     end;
end;

procedure EncontrarMinimo (a:arbolCliente; var min:string);
var
   minCant: integer;
begin
     minCant:= 999;
     if (a<>nil) then begin
          EncontrarMinimo(a^.HI,min);
          Minimo(a^.dato,minCant,min);
          EncontrarMinimo(a^.HD,min);
     end;
end;

procedure ImprimirMinimo (a:arbolCliente);
var
   min:string;
begin
     min:= '';
     EncontrarMinimo(a,min);
     writeln('La direccion con menor intervecciones es: ',min);
end;

{c) Implementar un módulo que imprima los DNI, nombre y apellido de los clientes cuyo número de DNI está
entre 15000000 y 30000000. El listado debe estar ordenado por DNI de manera descendente.}

procedure ImprimirCliente (c:cliente);
begin
     writeln('Nombre y Apellido');
     readln(c.nombreApellido);
     writeln('DNI');
     readln(c.dni);
end;

procedure BusquedaAcotada (a:arbolCliente; inf,sup:integer);
   begin
        if (a <> nil) then
           if (a^.dato.dni >= inf) then begin
              if (a^.dato.dni <= sup) then begin
                 BusquedaAcotada(a^.HD,inf,sup);
                 ImprimirCliente(a^.dato);
                 BusquedaAcotada(a^.HI,inf,sup);
              end
           else
               BusquedaAcotada(a^.HI,inf,sup);
           end
        else
            BusquedaAcotada(a^.HD,inf,sup);
end;

{d) Implementar un módulo que imprima, para cada cliente, su nombre y apellido junto al identificador y tipo de
mascota que pese más de 10 kg y que haya ingresado a la veterinaria entre los meses de Enero y Marzo
2023.}

procedure VerificarCliente(c:cliente);
begin
     writeln('Dato del Cliente: ',c.nombreApellido, 'Con dni: ',c.dni);
     writeln('Lista de Mascotas con mas 10kg, y que ingresaro entre enero y marzo de 2023');
     while( c.mascotas <> nil) do begin
            if (c.mascotas^.dato.peso >= 10) and (c.mascotas^.dato.fechaIngreso.anho = 2023) and ((c.mascotas^.dato.fechaIngreso.mes >= 1) and (c.mascotas^.dato.fechaIngreso.anho <= 3)) then begin
               writeln('Identificador: ', c.mascotas^.dato.identificador, ' tipo de mascota: ',c.mascotas^.dato.tipo);
            end;
            c.mascotas:= c.mascotas^.sig;
     end;
end;

procedure ImprimirCliente (a:arbolCliente);
begin
     if (a<>nil) then begin
        ImprimirCliente(a^.HI);
        VerificarCliente(a^.dato);
        ImprimirCliente(a^.HD);
     end;
end;

var
   a:arbolCliente;

begin
  a:= nil;
  CrearArbol(a);
  ImprimirMinimo(a);
  BusquedaAcotada(a,INF,SUP);
  ImprimirCliente(a);
end.

