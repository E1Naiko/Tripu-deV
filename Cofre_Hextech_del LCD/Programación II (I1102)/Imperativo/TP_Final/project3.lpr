Program project3;
Uses
     sysutils;
Type
     pedido= record
	      codSeg: integer;
	      fechaYhora: string;
	      dni: integer;
	      codArea: integer;
          domicilio: string;
          tel: string;
     end;

     listaPedidos = ^nodoLista;
     nodoLista = record
               dato: pedido;
               sig: listaPedidos;
     end;
     listacliente = ^cliente;
     cliente = record
               dni: integer;
               sig: listacliente;
     end;

     arbol = ^nodo;
     nodo = record
               cod: integer;
               total: integer;
               servicio: listacliente;
               HI,HD: arbol;
     end;

procedure agregarLista(var pri:listaPedidos; p:pedido);
var
  nuevo, anterior, actual: listaPedidos;
begin
    new (nuevo);
    nuevo^.dato:= p;
    nuevo^.sig := nil;
    if (pri = nil) then
         pri := nuevo
    else
    begin
         actual := pri;
         anterior := pri;
         while (actual<>nil) and (actual^.dato.dni < nuevo^.dato.dni) do begin
              anterior := actual;
              actual:= actual^.sig;
         end;
         if (anterior = actual) then
              pri := nuevo
         else
              anterior^.sig := nuevo;
         nuevo^.sig := actual;
    end;
end;

function cargarFecha(): string;{Genera una FECHA aleatoria}
var
  dia, mes, hora, seg: integer;
  s: string;
begin
  dia := random(30)+1;
  mes := random(12)+1;
  s := Concat(IntToStr(dia),'/',IntToStr(mes),'/2024 - ');
  hora := random(24);
  seg := random(60);
  if(hora < 10)then
	s := Concat(s, '0', IntToStr(hora))
  else
	s:= Concat(s, IntToStr(hora));
  if(seg < 10)then
	s := Concat(s, ':0', IntToStr(seg))
  else
	s:= Concat(s,':', IntToStr(seg));
  cargarFecha:= s;
end;

procedure crearLista(var l: listaPedidos);
var
   cant, cod: integer;
   p: pedido;
begin
     cant:= random(10); {genera hasta 100 elementos}
     cod:= 1;
     while (cant <> 0) do Begin
          p.codSeg:= cod;  {codigo de seguimiento}
          p.fechaYhora := cargarFecha();
          p.dni := random(60000000);  {dni}
          p.codArea := (random(4000)); {codigo de área}
          p.domicilio:= Concat('Domicilio', IntToStr(cod)); {domicilio}
          p.tel:= IntToStr(random(999999)+4000000); {telefono}
          agregarLista(l, p);
          cant:= cant-1;
          cod := cod+1;
     end;
end;

procedure imprimirPedido(p:pedido);
begin
    with(p)do begin
         writeln('El pedido ',codSeg, ' del cliente ', dni, ' sera atendido en la fecha ', fechaYhora, ' en el codigo de area ', codArea);
         writeln(' y domicilio ',domicilio, ' con tel. de contacto ', tel);
    end;
end;

procedure imprimirLista(l:listaPedidos);

begin
    while(l<>nil)do
    begin
         imprimirPedido(l^.dato);
         l:=l^.sig;
    end;
end;

procedure agregaradelante(var l:listacliente; dni:integer);
var
   nue:listacliente;
   begin
     new(nue);
     nue^.dni:= dni;
     nue^.sig:= l;
     l:= nue;
   end;

procedure agregarnodo (var a:arbol; p:pedido);
   begin
     if (a = nil) then begin
          new(a);
          a^.cod:= p.codArea;
          a^.total:= 1;
          a^.servicio:= nil;
          agregaradelante(a^.servicio,p.dni);
          a^.HD:= nil;
          a^.HI:= nil;
          end else
              if (a^.cod > p.codArea) then
                    agregarnodo(a^.HI,p)
                    else if (a^.cod < p.codArea) then
                          agregarnodo(a^.HD,p)
                          else begin
                              agregaradelante(a^.servicio,p.dni);
                              a^.total:= a^.total + 1;
                          end;
          end;

procedure Crearbol (var a:arbol; l:listaPedidos);
var  act: listaPedidos;
   begin
     act:= l;
     while (act <> nil) do begin
         agregarnodo(a,act^.dato);
         act:= act^.sig;
     end;
   end;
procedure imprimirlista(l:listacliente);
begin
  while (l <> nil) do begin
      writeln(l^.dni, ' |');
      l:= l^.sig;
  end;
end;

procedure imprimirnodo(a:arbol);
begin
  writeln('CODArea: ',a^.cod);
  writeln('Total: ',a^.total);
  writeln('Dnis que adquirieron el servicio: ');
  imprimirlista(a^.servicio);
  writeln;
end;

procedure imprimirarbol(a:arbol);
begin
  if(a <> nil) then begin
        imprimirarbol(a^.HI);
        imprimirarbol(a^.HD);
        imprimirnodo(a);
  end;
end;

function minimopedido(a:arbol):integer;
var
   min: integer;
begin
  if(a = nil) then
        minimopedido:= -1
        else begin
             min:= minimopedido(a^.HI);
             if (min = -1) then
                   minimopedido:= a^.cod
                   else
                   minimopedido:= min;
             end;
end;

procedure imprimirdni2(a:arbol; inf,sup:integer);
begin
  if (a <> nil) then
    if (a^.cod >= inf) then
      if (a^.cod <= sup) then begin
        imprimirnodo(a);
        imprimirdni2(a^.HI, inf, sup);
        imprimirdni2(a^.HD, inf, sup);
      end
      else
        imprimirdni2(a^.HI, inf, sup)
    else
      imprimirdni2(a^.HD, inf, sup);
end;

var
   l_inicial: listaPedidos;
   a: arbol;

begin
     Randomize;
     {Se crea la estructura inicial}
     l_inicial:= nil;
     a:= nil;
     crearLista(l_inicial);
     writeln (' Lista: ');
     imprimirLista(l_inicial);
     writeln (' Arbol Generado: ');
     Crearbol(a,l_inicial);
     imprimirarbol(a);
     writeln('El codigo de area con menor pedido: ',minimopedido(a));
     writeln;
     writeln('El cod de area con entre 1000 y 2000');
     {imprimirdni(a,1000,2000);}
     imprimirdni2(a,1000,2000);



     {Completar el programa}

     writeln('Fin del programa');
     readln;
end.

