Program project5;
Uses
     sysutils;
Type
     tweet = record
	      codigoUsuario: integer;
	      nombreUsuario: string;
	      mensaje: string;
	      esRetweet: boolean;
     end;

     listaTweets = ^nodoLista;
     nodoLista = record
               dato: tweet;
               sig: listaTweets;
     end;

     {Completar agregando aquí las estructuras de datos necesarias en el ejercicio}
     arbol=^nodo;
     nodo= record
               usuario: integer;
               nombre: string;
               cantidad: integer;
               HI,HD: arbol;
     end;

{agregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(var l: listaTweets; t: tweet);
var
   aux: listaTweets;
begin
     new(aux);
     aux^.dato := t;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con tweets aleatorios}
procedure crearLista(var l: listaTweets);
var
   t: tweet;
   texto: string;
begin
     t.codigoUsuario := random(20);
     while (t.codigoUsuario <> 0) do Begin
          texto:= Concat(IntToStr(t.codigoUsuario), '-mensaje-', IntToStr(random (50)));
          t.nombreUsuario := Concat('Usuario-',IntToStr(t.codigoUsuario));
          t.mensaje := texto;
          t.esRetweet := (random(2)=0);
          agregarAdelante(l, t);
          t.codigoUsuario := random(20);
     end;
end;


{imprimir - Muestra en pantalla el tweet}
procedure imprimir(t: tweet);
begin
     with (t) do begin
          write('Tweet del usuario @', nombreUsuario, ' con codigo ',codigoUsuario, ': ', mensaje, ' RT:');
          if(esRetweet)then
               writeln(' Si')
          else
               writeln('No ');
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaTweets);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

procedure agregarnodo( var a:arbol; t:tweet);
begin
     if (a = nil) then begin
       new(a);
       a^.usuario:= t.codigoUsuario;
       a^.nombre:= t.nombreUsuario;
       a^.cantidad:= 1;
       a^.HI:= nil;
       a^.HD:= nil;
       end else
           if (a^.usuario > t.codigoUsuario) then
             agregarnodo(a^.HI, t)
	   else agregarnodo(a^.HD, t);
end;

procedure crearbol( var a:arbol; l:listatweets);
begin
     while (l <> nil) do begin
          agregarnodo(a,l^.dato);
          l:= l^.sig;
     end;
end;

procedure imprimirnodo(a:arbol);
begin
     writeln('Codigo Usuario: ',a^.usuario);
     writeln('Nombre del usuario: ', a^.nombre);
     writeln('Cantidad de mensajes: ',a^.cantidad);
end;

procedure imprimirarbol(a:arbol);
begin
     if( a <> nil) then begin
       imprimirarbol(a^.HI);
       imprimirnodo(a);
       imprimirarbol(a^.HD);
     end;
end;

procedure cantidad( a:arbol; inf,sup :integer; var cant: integer);
begin
     if (a <> nil) then begin
        if (a^.usuario >= inf) then begin
           if (a^.usuario <= sup) then begin
              cant:= cant + a^.cantidad;
              cantidad(a^.hi, inf, sup,cant);
              cantidad(a^.hd, inf, sup,cant);
           end
           else begin
             cantidad(a^.hi, inf, sup,cant);
           end
        end
        else begin
          cantidad(a^.hd, inf, sup,cant);
        end;
  end;
end;

{function encontrarmaximo (a:arbol):integer;
var act: integer;
begin
	if (a = nil) then
           maximo:= ''
	   else begin
	        act:= maximo(a^.HD);
	        if (act = '') then
                   maximo:= a^.nombre
	           else
                       maximo:= act;
	   end;
end;}

procedure maximo (a:arbol; var nom:string; var max:integer);
begin
     if (a<>nil) then begin
        maximo(a^.HI,nom,max);
        if(a^.cantidad > max) then begin
           max:= a^.cantidad;
           nom:= a^.nombre;
        end;
        maximo(a^.HD,nom,max);
     end;
end;

var
   l: listaTweets;
   a: arbol;
   cant,max:integer;
   nom:string;
begin
     Randomize;
     cant:=0;
     max:= -1;
     a:= nil;
     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);
     crearbol(a,l);
     writeln ('---------------------------------');
     writeln ('Arbol Generado: ');
     imprimirarbol(a);
     writeln('----------------------------------');
     cantidad(a,1,5,cant);
     writeln(' Cantidad de mensajes de los usuarios entre 1 y 5: ',cant);

     writeln('--------------------------');
     maximo(a,nom,max);
     writeln('El nombre con mas mensajes: ',nom);
     {Completar el programa}
     writeln('Fin del programa');
     readln;
end.


