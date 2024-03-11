program Grupo1Tp1;
{
Un negocio de puertas y ventanas dispone de una lista de los productos que tiene para la venta. De cada producto se conoce el código, la marca, el nombre, el año de fabricación y el precio. Esta información está ordenada, dentro de una lista simple, primero por marca y dentro de cada marca por año.

Se solicita realizar un programa que:
a.	Genere una estructura con la información de los productos ordenados por marca, donde por cada marca se tengan los productos ordenados por año.

De las estructuras de datos disponibles utilice la que crea más adecuada para:
b.	Informar la cantidad de productos, de la marca “Abercom”, fabricados entre los años 2018 y 2020 inclusive y cuyo precio supero los 100000$.
c.	Imprimir un reporte con la siguiente información:

}
Uses
     sysutils;
Type
     producto = record
          codigo: integer;
	      nombre: string;
	      marca: string;
	      anio: 2000..2022;
		  precio: real;
     end;

     listaProductos = ^nodoLista;
     nodoLista = record
               dato: producto;
               sig: listaProductos;
     end;

     listaProductosExtremos = record
               pri, ult: listaProductos;
     end;

     listaMarcas = ^nodoMarcas;
     nodoMarcas = record
               dato: listaProductosExtremos;
               sig: listaMarcas;
     end;



Procedure agregarAdelante(var l: listaProductos; p: producto);
var
   aux: listaProductos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con productos aleatorios}
procedure crearLista(var l: listaProductos);
var
   i,j:integer;
   p: producto;

   v : array [1..10] of string;
begin
     v[1]:= 'Abercom';
     v[2]:= 'Aluminium';
     v[3]:= 'ClearWindows';
     v[4]:= 'IndArg';
     v[5]:= 'La Foret';
     v[6]:= 'Open';
     v[7]:= 'Portal';
     v[8]:= 'Puertamania';
     v[9]:= 'PVCPremium';
     v[10]:= 'Ventalum';

	 for i:=random(10) downto 1 do {for de marca}
	 begin
	     p.marca:= v[i];
		 for j:=random(5) downto 1 do {for de anio}
	     begin
		 	p.anio:= 2016+j;
			p.codigo:= random(10);
			while (p.codigo <> 0) do Begin
				p.nombre:= Concat('Producto-', IntToStr(random (200)));
				p.precio := random(1000000);
				agregarAdelante(l, p);
                p.codigo:= random(10);
		   end;
		 end;
	 end;
end;



{imprimir - Muestra en pantalla el producto}
procedure imprimir(p: producto);
begin
     with (p) do begin
          writeln('Producto', nombre, ' con codigo ',codigo, ': ', marca, ' Anio:', anio, ' Precio: ', precio:2:2);
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaProductos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

{------------------------ Nosotros ------------------------}
procedure insertarFinal(var l: listaProductosExtremos; Elemento: producto);
  var nue: listaProductos;
  begin
    new(nue); nue^.dato:= elemento; nue^.sig:= nil;
    if (l.pri=nil) then l.pri:= nue
                else l.ult^.sig:= nue;
    l.ult:=nue;
  end;



procedure Insertarordenado (var l: listaProductosExtremos; elemento: producto);  // ORDENA SEGUN MARCA
  var nue, ant, act: listaProductos;
  begin
       new(nue); nue^.dato:= elemento;
       act:=l.pri; ant:=l.pri;
       while (act <> nil) and (elemento.codigo < act^.dato.codigo) do begin
             ant:= act; act:= act^.sig;
       end;
       if (ant = act) then insertarFinal(l.pri, elemento)
                      else insertarFinal(ant^.sig, elemento);

  end;

var
   l: listaProductos;
begin
     Randomize;

     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);
     readln;
end.
