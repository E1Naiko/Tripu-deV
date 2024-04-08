{
Una empresa de telecomunicaciones procesa los datos de varios pedidos
* de conexión que llegan telefónicamente. Se dispone de una lista con
* los datos cargados y listos para ser procesados. Cada pedido posee un
* código único de seguimiento, fecha y hora del turno de conexión, DNI
* del cliente, código de área, domicilio del cliente y su número
* telefónico. 

Posteriormente al ingreso y almacenamiento de la información, se pide: 
	a) Crear una nueva estructura que almacene para cada código de área,
	* el total de pedidos de dicha área y los DNI de los clientes que
	* solicitaron el servicio. Esta estructura debe estar ordenada por
	* código de área y debe ser eficiente para la búsqueda por dicho
	* criterio. 

Al finalizar el procesamiento de a), elija las estructuras adecuadas para: 
	b) Implementar un módulo que retorne el código de área con menor
	* cantidad de pedidos de servicio. 
	c) Implementar un módulo que imprima los DNI de clientes cuyo código
	* de área se encuentre entre 1000 y 2000, ordenados por código de área.
	d) Implementar un módulo que, dado un código de área, imprima los
	* DNI de los clientes que solicitan conexión. 
	e) Implementar un programa principal que utilice los módulos implementados.
}


Program ejercicio3;
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
		s := Concat(IntToStr(dia),'/',IntToStr(mes),'/2020 - ');
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
		with(p)do
			writeln('El pedido ',codSeg, ' del cliente ', dni, ' sera atendido en la fecha ', fechaYhora, ' en el codigo de area ', codArea, ' y domicilio ', domicilio, ' con tel. de contacto ', tel);
	end;

procedure imprimirLista(l:listaPedidos);
	begin
		while(l<>nil)do
		begin
			imprimirPedido(l^.dato);
			l:=l^.sig;
		end;
	end;

var
   l_inicial: listaPedidos;

begin
     Randomize;
     {Se crea la estructura inicial}
     l_inicial:= nil;
     crearLista(l_inicial);
     writeln ('Lista: ');
     imprimirLista(l_inicial);

     {Completar el programa}

     writeln('Fin del programa');
     readln;
end.
