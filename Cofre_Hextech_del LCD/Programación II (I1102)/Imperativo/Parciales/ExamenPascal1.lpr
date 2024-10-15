{Enunciado
El Ministerio de Economía de la Nación desea procesar la información de los viajes realizados a través de las tarjetas
SUBE registradas. De cada viaje se conoce: identificador del viaje, número de tarjeta SUBE, fecha del viaje (día, mes y
año), monto, medio de transporte (Tren, Colectivo o Subte), y la información de su dueño: nombre y apellido y CUIT.
Esta información se lee desde teclado sin ningún orden específico hasta que alcance a la tarjeta cuyo dueño tiene el
CUIT “99-99999999-9"}

program ExamenPascal1;
const
    FIN= 999;
    FINCUIT= '99-99999999-9';
    INF= '20-30000000-2';
    SUP= '30-30000000-3';
type
  fecha= record
    dia: integer;
    mes: integer;
    anho: integer;
  end;

  dueno = record
    nombreApellido: string;
    cuit: string;
  end;

  viaje = record
    identificador: integer;
    sube: longint;
    fechas: fecha;
    monto: real;
    medio: string;
    propietario: dueno;
  end;

  viajeRealizado = record
    identificador: integer;
    fechas: fecha;
    monto: real;
    medio: string;
  end;

  listaViajes = ^nodoviajes;
  nodoviajes = record
    dato: viajeRealizado;
    sig: listaViajes;
  end;

  persona = record
    cuit: string;
    nombreApellido: string;
    sube: integer;
    viaje: listaViajes;
  end;

  arbolPersonas = ^nodoPersona;
  nodoPersona = record
    dato: persona;
    totalviaje: integer;
    total: real;
    HI,HD: arbolPersonas;
  end;

  {(Insico A) Realizar un módulo que procese la información descripta anteriormente y genere una estructura donde para
  cada persona se guarde su CUIT, nombre y apellido, número de tarjeta SUBE y los viajes realizados. De cada
  viaje interesa almacenar el identificador del viaje, la fecha del viaje (día, mes y año), monto, medio de
  transporte. Esta estructura debe estar ordenada por CUIT de la persona y debe ser eficiente para la búsqueda
  por dicho criterio.}

procedure CargarFecha (var f:fecha);         // Modulo de cargar la fecha
begin
     with f do begin
          writeln('Dia:');
          readln(dia);
          writeln('Mes:');
          readln(mes);
          writeln('Anho:');
          readln(anho);
     end;
end;

procedure CargarDueno (var d:dueno);
begin
     writeln('Nombre y Apellido');
     readln(d.nombreApellido);
     writeln('CUIT');
     readln(d.cuit);

end;

procedure CargarViaje (var v:viaje);         // Carga viaje hasta que llegue al valor de corte
var
  f: fecha;
  d:dueno;
begin
     with v do begin
        writeln('Datos del Propietario');
        CargarDueno(d);
        if (d.cuit <> FINCUIT) then begin
           writeln('Identificador');
           readln(identificador);
           writeln('Sube');
           readln(sube);
           writeln('Fecha de Viaje');
           CargarFecha(f);
           writeln('Monto de Viaje');
           readln(monto);
           writeln('Medio de transporte');
           readln(medio);
           writeln('Datos del Propietario');
           CargarDueno(d);
        end;
     end;
end;

procedure AgregarAdelante (var l:listaViajes; v:viaje);       // Agrega a la lista de viajes de cada persona
var
  nue: listaViajes;
begin
     new(nue);
     nue^.dato.identificador:= v.identificador;
     nue^.dato.fechas:= v.fechas;
     nue^.dato.monto:= v.monto;
     nue^.dato.medio:= v.medio;
     nue^.sig:= l;
     l:= nue;
end;

procedure InsertarNodo (var a: arbolPersonas; v: viaje);       // Inserta cada persona en un arbol ordenado por Cuit
begin
     if (a = nil) then begin
     new(a);
     a^.dato.cuit:= v.propietario.cuit;
     a^.dato.nombreApellido:= v.propietario.nombreApellido;
     a^.dato.sube:= v.sube;
     a^.dato.viaje:= nil;
     a^.totalviaje:= 1;
     a^.total:= 0;
     AgregarAdelante(a^.dato.viaje,v);
     a^.HD:= nil;
     a^.HI:= nil;
     end else
         if (a^.dato.cuit > v.propietario.cuit) then
	    InsertarNodo(a^.HI, v)
	    else if (a^.dato.cuit < v.propietario.cuit) then
	         InsertarNodo(a^.HD, v)
	    else begin
            AgregarAdelante(a^.dato.viaje, v);
            a^.totalviaje:= a^.totalviaje + 1;
            a^.total:= a^.total + v.monto;
            end;
end;

Procedure Crearbol (var a:arbolPersonas); // Modulo para Cargar el viaje y lo agregar al arbol
var
  v:viaje;
begin
     Cargarviaje(v);
     while (v.propietario.cuit <> FINCUIT) do begin
          InsertarNodo (a,v);
          CargarViaje(v);
     end;
end;

{Inciso B) Implementar un módulo que informe el nombre y apellido de la persona que gastó más dinero entre todos
sus viajes.}

procedure EncontrarMaximo (d:persona; t:real; var max:string; var maxmonto: real);
begin
     if(maxmonto < t) then begin
          maxmonto:= t;
          max:= d.nombreApellido;
     end;
end;

Procedure RecorrerArbol (a:arbolpersonas; var max:string);
var
  maxmonto: real;
begin
     maxmonto:= 0;
     if(a <> nil) then begin
          RecorrerArbol(a^.HI,max);
          EncontrarMaximo(a^.dato,a^.total,max,maxmonto);
          RecorrerArbol(a^.HD,max);
     end;
end;

{Inciso C) Implementar un módulo que imprima el CUIT, nombre y apellido y la cantidad de viajes de las personas cuyo
CUIT está entre “20-20000000-2” y “30-30000000-3”. El listado debe estar ordenado por CUIT de manera
ascendente.}

procedure ImprimirPersona (p:persona; v:real);
begin
     writeln('Cuit: ', p.cuit);
     writeln('Nombre y Apellido: ', p.nombreApellido);
     writeln('Cantidad de Viajes: ', v);
end;

procedure BuscarNombres (a:arbolPersonas; inf,sup:string);        // Busca las personas cuyo cuit esta dentro del rango mencionado y lo agrega en una lista
begin
 if (a <> nil) then
    if (a^.dato.cuit >= inf) then begin
      if (a^.dato.cuit <= sup) then begin
        BuscarNombres(a^.HI,inf,sup);
        ImprimirPersona(a^.dato,a^.total);
        BuscarNombres(a^.HD,inf,sup);
      end
      else
         BuscarNombres(a^.HI,inf,sup);
    end
    else
       BuscarNombres(a^.HD,inf,sup);
end;

{d)Implementar un módulo que imprima para cada persona que tenga como último dígito de su número de
tarjeta SUBE el 4 o el 5: su CUIT junto al número de la tarjeta y el promedio gastado en aquellos viajes
realizados en “Colectivo” entre los meses de Diciembre 2023 y Marzo 2024. }

procedure RecorrerListaViajes (p:persona; var prom:real);
var
  tot: real;
  cant: integer;
begin
     tot:= 0;
     cant:= 0;
     while (p.viaje <> nil) do begin
        if (((p.viaje^.dato.fechas.anho = 2023) and (p.viaje^.dato.fechas.mes = 12)) or ( (p.viaje^.dato.fechas.anho = 2024) and (p.viaje^.dato.fechas.mes >= 1) and  (p.viaje^.dato.fechas.mes <= 3))) and (p.viaje^.dato.medio = 'Colectivo') then begin
           tot:= tot + p.viaje^.dato.monto;
           cant:= cant + 1;
        end;
        p.viaje:= p.viaje^.sig;
     end;
     prom:= (tot/cant);
        {if (año = 2023 and mes = 12) and (p.medio ='Colectivo') then begin
           total :=total +1;
           end
        else
            if ( año = 2024 and mes >= 1 and  mes <= 3) and (p.medio= 'Colectivo') then
               total :=total +1;  }
     end;

procedure VerificarPersona (p:persona);
var
  prom: real;
begin
     prom:= 0;
     if(p.sube mod 10= 4) or (p.sube mod 10= 5) then begin
       writeln('Cuit: ', p.cuit);
       writeln('Nro de Tarjeta Sube: ', p.sube);
       RecorrerListaViajes(p,prom);
       writeln('Promedio gastado: ', prom);
     end;
 end;

procedure Imprimir (a:arbolPersonas);
begin
     if(a<>nil) then begin
       Imprimir(a^.HI);
       VerificarPersona(a^.dato);
       Imprimir(a^.HD);
     end;
end;

var
  a:arbolPersonas;
  max:string;

begin
  a:= nil;
  Crearbol(a);
  RecorrerArbol(a,max);
  writeln(max, 'es la persona que mas gasto');
  BuscarNombres(a,INF,SUP);
  Imprimir(a);
  readln;
end.

