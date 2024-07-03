{Enunciado
La UNLP otorga subsidios a sus investigadores. De cada subsidio se conoce: número de solicitud, fecha de pedido (día,
mes y año), el monto solicitado, el plan de trabajo, si el mismo fue otorgado o no así como el nombre, apellido y CUIT
de la persona que hizo el pedido. Esta información se lee desde teclado hasta que llegue el plan de trabajo “FIN”.
}

program ExamenPascal3;
const
  FIN = 'FIN';
  INF = '20-00000000-0';
  SUP = '30-00000000-0';

type
  fecha = record
    dia:integer;
    mes:integer;
    anho:integer;
  end;

  subsidio = record
    numSolicitud: integer;
    fechaPedido: fecha;
    monto: real;
    planTrabajo: string;
    otorgado: boolean;
    nombreApellido: string;
    cuit: string;
  end;

  subsidios = record
    numSolicitud: integer;
    fechaPedido: fecha;
    monto: real;
    planTrabajo: string;
    otorgado: boolean;
  end;

  listaSubsidio = ^nodoSubsidio;
  nodoSubsidio = record
    dato: subsidios;
    sig: listaSubsidio;
  end;

  investigador = record
               cuit: string;
               nombreApellido: string;
               subsidios: listaSubsidio;
    end;
  arbolInvestigador = ^nodoInvestigador;
  nodoInvestigador = record
    dato: investigador;
    HI,HD: arbolInvestigador;
  end;

{a) Realizar un módulo que procese la información descripta anteriormente y genere una nueva estructura donde
para cada investigador se guarde su CUIT, nombre y apellido junto a la información de los subsidios que
solicitó. De cada subsidio interesa almacenar el número de solicitud, la fecha de pedido (día, mes y año), el
monto solicitado, el plan de trabajo y si el mismo fue otorgado o no. Esta estructura debe estar ordenada por
CUIT y debe ser eficiente para la búsqueda por dicho criterio. }

procedure CargarFecha (var f:fecha);
begin
     writeln('/');
     read(f.dia);
     write('/');
     read(f.mes);
     write('/');
     read(f.anho);
end;
procedure CargarSubsidio (var s:subsidio);
var
  f:fecha;
  trues:string;
begin
     with s do begin
          writeln('Plan de trabajo');
          readln(planTrabajo);
          if (planTrabajo <> FIN) then begin
             writeln('Numero de Solicitud');
             readln(numSolicitud);
             writeln('Fecha de Solicitud');
             CargarFecha(f);
             writeln('Monto');
             readln(monto);
             writeln('Si fue otorgado o no (si/no)');
             readln(trues);
             if ( trues = 'si') then
                otorgado:= true
             else
                 if ( trues = 'no') then
                    otorgado:= false
                 else
                     writeln('Dato no valido');
             writeln('Nombre y Apellido');
             readln(nombreApellido);
             writeln('Cuit');
             readln(cuit);
          end;
     end;
end;

procedure AgregarAdelante(var l:listaSubsidio; s:subsidio);
var
  nue:listaSubsidio;
begin
     new(nue);
     nue^.dato.numSolicitud:= s.numSolicitud;
     nue^.dato.fechaPedido:= s.fechaPedido;
     nue^.dato.monto:= s.Monto;
     nue^.dato.planTrabajo:= s.planTrabajo;
     nue^.dato.otorgado:= s.otorgado;
     nue^.sig:= l;
     l:= nue;
end;

procedure InsertarNodo (a:arbolInvestigador; s:subsidio);
begin
     if (a <> nil) then begin
        new(a);
        a^.dato.cuit:= s.cuit;
        a^.dato.nombreApellido:= s.nombreApellido;
        a^.dato.subsidios:= nil;
        AgregarAdelante(a^.dato.subsidios,s);
        a^.HD:= nil;
        a^.HI:= nil;
     end else
        if (a^.dato.cuit > s.cuit) then
	    InsertarNodo(a^.HI, s)
	else if (a^.dato.cuit < s.cuit) then
	         InsertarNodo(a^.HD, s)
	     else begin
                  AgregarAdelante(a^.dato.subsidios,s);
             end;
end;

procedure CrearArbol (var a:arbolInvestigador);
var
  s:subsidio;
begin
     CargarSubsidio(s);
     while (s.cuit <> FIN) do begin
          InsertarNodo(a,s);
          CargarSubsidio(s);
     end;
end;

{Al finalizar el procesamiento de a), se pide:
b) Implementar un módulo que informe para cada investigador, el nombre y apellido junto al monto promedio de
los subsidios solicitados entre Febrero y Diciembre del 2023.}

procedure Informar (i:investigador);
var
  prom,tot:real;
  aux:listaSubsidio;
  cant: integer;
begin
     prom:=0; cant:= 0; tot:=0;
     aux:= i.subsidios;
     writeln('Nombre y Apellido del investigador: ',i.nombreApellido);
     while (aux <> nil) do begin
          if (aux^.dato.fechaPedido.anho = 2023) and ((aux^.dato.fechaPedido.mes >= 2) and (aux^.dato.fechaPedido.mes <= 12)) then begin
             cant:= cant + 1;
             tot:= tot + aux^.dato.monto;
          end;
          aux:= aux^.sig;
     end;
     prom:= (tot/cant);
     writeln('El Monto Promedio es: ', prom,' pesos');
end;

procedure InformarInvestigador (a:arbolInvestigador);
begin
     if (a <> nil) then begin
        InformarInvestigador(a^.HI);
        Informar(a^.dato);
        InformarInvestigador(a^.HD);
     end;
end;

{c) Implementar un módulo que retorne el CUIT del investigador junto con el porcentaje de subsidios otorgados,
para aquellos investigadores que poseen un CUIT entre “20-00000000-0” y “30-00000000-0”.}

procedure RetornarCuit (i:investigador; var cuit:string; var por:real);
var
  aux: listaSubsidio;
  cant,cantSubsidio:integer;
begin
     cantSubsidio:= 0; cant:=0;
     aux:= i.subsidios;
     while (aux <> nil) do begin
          cantSubsidio:= cantSubsidio + 1;
          if (aux^.dato.otorgado= true) then begin
             cant:= cant + 1;
          end;
          aux:= aux^.sig;
     end;
     por:= ((cantSubsidio*cant)/100);
end;

procedure BusquedaAcotada (a:arbolInvestigador; inf,sup:string);
var
  cuit: string;
  por: real;
begin
     cuit:= ''; por:=0;
     if(a <> nil) then
          if (a^.dato.cuit >= inf) then begin
             if (a^.dato.cuit <= sup) then begin
                BusquedaAcotada(a^.HD,inf,sup);
                RetornarCuit(a^.dato,cuit,por);
                writeln('El Investigador con cuit: ', cuit, 'tiene: ',por,' de subsidio otorgado');
                BusquedaAcotada(a^.HI,inf,sup);
             end
             else
               BusquedaAcotada(a^.HI,inf,sup);
          end
          else
            BusquedaAcotada(a^.HD,inf,sup);
end;


{d) Implementar un módulo que retorne el número de solicitud del subsidio con el mayor monto solicitado entre
todos los subsidios pedidos por los investigadores.}

procedure NumSolicitud (i:investigador; var maxNum:integer);
var
  aux:listaSubsidio;
begin
     aux:=i.subsidios;
     max:=0;
     while (aux <> nil) do begin
           if (aux^.dato.monto > max) then begin
              max:= aux^.dato.monto;
              maxNum:= aux^.dato.numSolicitud;
           end;
           aux:= aux^.sig;
     end;
end;

procedure RecorrerArbol (a:arbolInvestigador);
var
  max: integer;
begin
     max:= 0;
     if(a <> nil) then begin
        RecorrerArbol (a^.HI);
        NumSolicitud(a^.dato,max);
        writeln('El num de solicitud: ',max,' tiene el mayor monto solicitado entre los investigadores');
        RecorrerArbol(a^.HD);
     end;
end;

var
  a:arbolInvestigador;

begin
  a:= nil;
  CrearArbol(a);
  InformarInvestigador(a);
  BusquedaAcotada(a,INF,SUP);
  RecorrerArbol(a);
end.
