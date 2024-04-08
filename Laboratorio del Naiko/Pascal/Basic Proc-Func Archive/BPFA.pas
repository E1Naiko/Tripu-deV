
Program BPFA; // Basic Procedure-Function Archive for pascal



procedure PARA_SECUENCIAS_DE_CARACTERES_________();
begin
end;

Procedure recorrerSecuenciaDeCaracteres(devuelveCantCaracteres, devuelveCantPalabras: integer);
      // RECORRE UNA SECUENCIA DE CARACTERES Y DEVUELVE LA CANTIDAD DE PALABRAS Y CARACTERES QUE LA CONFORMAN
      // EL ESPACIO NO ES CONCIDERADO COMO CARACTER
      // LA LECUTURA TERMINA CUANDO SE ENCUENTRA EL CARACTER <termina> O CUANDO LLEGA A <cantTotal> DE CARACTERES
      
      Const 
          termina =   'z';
          cantTotal =   500;
      
      Procedure descartarBlancos(Var act:char; Var cont:integer);
         Begin
             While (act=' ') And (cont<cantTotal) Do
                 Begin
                     read(act);
                     cont := cont+1;
                 End;
         End;
      Procedure recorrerPalabra(Var act:char; Var contGeneral: integer);
         Begin
             While (act<>' ') And (act<>termina) And (contGeneral<cantTotal) Do
                 Begin
                     contGeneral := contGeneral+1;
                     ant := act;
                     read(act);
                 End;
         End;
   
   Var 
       // anterior para guardar posible ultimo caracter, y actual para el lector de caracteres
       ant, act:   char;
   
       // contadores
       contGeneral, contPalabras:   integer;
   
   Begin
       // Inicializo variables
       contGeneral := 0;
       contPalabras := 0;
       ant := ' ';
       act := ' ';
   
       // Prog Ppal.
       //writeln(' --- Introduzca una secuencia de caracteres: ');
   
       Repeat
           Begin
               ant := act;
               read(act);
   
               descartarBlancos(act,contGeneral);
   
               // SI O SI me encuentro al prinicipio de una palabra        
               contPalabras := contPalabras+1;
   
               // recorro el interior de la palabra
               recirrerPalabra(act,contGeneral);
   
               // SI O SI estoy al final de una palabra
   
           End
       Until (contGeneral=cantTotal) Or (act=termina);
   
       // informo
       //writeln(' - Palabras totales: ',contPalabras);
   
   End;


// ------------------------------------- Vectores -------------------------------------

procedure PARA_VECTORES____________();
begin
end;

{
const
	DIMF = 5;
type
	indice = 0..DIMF // valor minimo-1.. valor max
	vector = array [1..dimF] of integer;
}

procedure insertarVector(var v: vector; var dimL: indice; pos: indice; elemento: integer; exito: boolean);
	var j: indice;
	begin
		if (dimL < DIMF) then begin
			for j:= dimL downto pos do v[J+1]:= v[j];
			v[pos]:=elem;
			dimL:= dimL+1;
			exito:= true;
		end else exito:= false;
	end;
	
function determinarPosicionVector(v:vector; elemento: integer; dimL: indice): indice;
	const ERROR_DPV = 0;
	var pos: indice;
	begin
		pos:= 1;
		while (pos <= dimL) and (x > v[pos]) do pos:= pos+1;
		if (pos > dimL) then pos:= ERROR_DPV;
		determinarPosicionVector:= pos;
	end;
	
procedure insertarOrdenadoVector(var v: vector; var dimL: indice; elemento: integer; var exito: boolean);
	const ERROR_DPV = 0;
	var pos: indice;
	begin
		pos:= determinarPosicionVector(v, elemento, dimL);
		if (pos<>ERROR_DPV) then insertar(v,dimL,pos,elemento);
	end;
	
procedure ordenarVector(var v: vector; dimL: indice);
	var i,j: indice; elemento: integer;
	begin
		for i:=2 to dimL do begin
			elemento:= v[i];
			J:=i-1;
			while (j>0) and (v[j] > elemento) do begin
				v[j+1]:= v[j];
				j:= j-1;
			end;
			v[j+1]:= elemento;
		end;
	end;
	
procedure busquedaDicotomicaVector(var v: vector; j, dimL:indice; x: integer);
	const ERROR_BDV = 0;
	var pri, med, ult:= indice;
	begin
		j:= 0; pri:=1; ult:= dimL; med:= (pri+ult) div 2;
		while (pri<=ult) and (x <> v[med]) do begin
			if (x<v[med]) then ult:= med-1
						  else pri:=med+1;
			med:=(pri+ult) div 2
		end;
		
		// se encontro?
		if (pri < ult) then j:= med
					   else j:= ERROR_BDV; // sino se encuentra devuelve este valor
	end;
	
// ------------------------------------- Listas -------------------------------------

Procedure PARA_LISTAS_SIMPLES________________();
begin
end;

{
    lista = ^nodo;
    nodo = record
        dato: integer;
        sig: lista;
    end;
    Tlista = record
        pri, ult: lista;
    end;
}

Procedure liberarMem(Var l:lista);
   Var aux:   lista;
   Begin
       While (l<>Nil) Do
           Begin
               aux := l;
               l := l^.sig;
               dispose(aux);
           End;
   End;

Procedure imprimirLista(l:lista);
   Begin
       writeln('-----------------------------------------');
       While (l<>Nil) Do
           Begin
               writeln();
               l := l^.sig;
           End;
   End;


Procedure agregarInicioLS(var l: lista; elemento: integer);
   var
      aux: lista;
   begin
        new(aux);
        aux^.dato := elemento;
        aux^.sig := l;
        l:= aux;
   end;


Procedure agregarFinalLS(Var l: lista; elem: integer {cambiar}); // NO EFICIENTE
   Var act, ant, nue:   lista;
   Begin
       new(nue); nue^.datos := elem; nue^.sig := Nil;
       act:= l; ant:= l;
       while (act<>nil) do begin
			ant:=act; act:=act^.sig;
       end;
       ant^.sig:= nue;
   End;


Procedure agregarFinalLS(Var l: Tlista; elem: integer {cambiar}); // EFICIENTE
   Var nue:   lista;
   Begin
       new(nue);
       nue^.datos := elem;
       nue^.sig := Nil;
   
       If l=Nil Then l.pri := nue
       Else l.ult^.sig := nue;
       l.ult := nue;
   End;

Procedure borrarElementoLS(Var l: lista; nom:cadena; Var exito: Boolean);
   Var ant, act:   lista;
   Begin
       exito := false;
       act := l;
   
       // Busco el elemento
       While (act<>Nil) And Not(exito) Do
           Begin
               If (act^.dato.nom = nom) Then exito := True
               Else
                   Begin
                       ant := act;
                       act := act^.sig;
                   End;
           End;
   
       // lo elimino
       If exito Then
           Begin
               If (act = l) Then l := act^.sig
               Else ant^.sig := act^.sig;
               dispose(act);
           End;
   End;

Procedure insertarElementoLS (Var l: lista; elem: integer);
// ORDENADO

    Var nue, ant, act:   lista;
    Begin
        new(nue);
        nue^.dato := elem;
        act := l;
        ant := l;
    
        // busco pos
        While (act<> Nil) And (act^.dato <> elem) Do
            Begin
                // CAMBIAR
                ant := act;
                act := act^.sig;
            End;
    
        // inserto
        If (ant = act) Then l := nue // dato va al principio
        Else ant^.sig := nue;
        // intermedio/final
        nue^.sig := act;
    End;

procedure insertarOrdenadoLS(var l: lista; elemento: integer);
    var nue, ant, act: lista;
    begin
        new(nue); nue^.dato:= elemento; nue^.sig:= nil;
        act:=l; act:=l;
    
        while (act <> nil) and (act^.dato < elemento) do begin
            ant:= act; act:=act^.sig;
        end;
    
        if (l=act) then l:= nue
                    else ant^.sig:= nue;
        nue^.sig:=act;
    end;

{ ------------------------------------- ARBOLES -------------------------------------}

Procedure PARA_ARBOLES_________________________();
begin
end;

{
    // Arbol de enteros
    arbol =   ^nodoA;
    nodoA =   Record
        dato:   integer;
        HI:   arbol;
        HD:   arbol;
    End;
}

procedure insertarEnRamaArbol (var a: arbol; elemento: integer); // toma un elemento y lo inserta en una rama de un arbol
   begin
    if (a = nil) then begin
                  new(a);
                  a^.dato:= elemento;
                  a^.HD:= nil;
                  a^.HI:= nil;
      end else
        if (a^.dato > elemento) then
                    insertarEnRama(a^.HI, elemento)
        else insertarEnRama(a^.HD, elemento);
   end;

procedure insertarEnRamaArbolDeListas(var a: arbol; elemento: integer); // toma un elemento y lo inserta en una rama de un arbol
	begin
		if (a = nil) then begin
					new(a);
					a^.dato:= nil;
					agregarAdelante(a^.dato, elemento);
					a^.HD:= nil;
					a^.HI:= nil;
		end else
			if (a^.dato > elemento) then
						insertarEnRamaArbolDeListas(a^.HI, elemento)
			else if (a^.dato < elemento) then
					insertarEnRamaArbolDeListas(a^.HD, elemento)
				else agregarAdelante(a^.dato, elemento);
	end;

procedure cargarArbol(l: lista; var a: arbol);
   var aux: lista;
   begin
     aux:= l;
     while (aux<>nil) do begin
       insertarRama(a,aux^.dato);
       aux:= aux^.sig;
     end;
   end;


Procedure preOrden( a: arbol );
   begin
     if ( a <> nil ) then begin
       write (a^.dato, '   ');
       {
       // DE MENOR A MAYOR
       preOrden (a^.HI);
       preOrden (a^.HD);
	   }
	   {
       // DE MAYOR A MENOR
       preOrden (a^.HD);
       preOrden (a^.HI);
	   }
     end;
   end;

procedure enOrden(a: arbol);
   begin
     {
     // DE MENOR A MAYOR
     if (a <> nil) then begin
       enOrden(a^.HI);
       write (a^.dato, '   ');
       enOrden(a^.HD);
     end;
     }
     {
     // DE MAYOR A MENOR
     if (a <> nil) then begin
       enOrden(a^.HD);
       write (a^.dato, '   ');
       enOrden(a^.HI);
     end;
     }
   end;

procedure postOrden(a: arbol);
   begin
        if (a<>nil) then begin
          {
          // DE MAYOR A MENOR
          postOrden(a^.HD);
          postOrden(a^.HI);
		  }
		  {
          // DE MENOR A MAYOR
          postOrden(a^.HI);
          postOrden(a^.HD);
		  }
          write (a^.dato, '   ');
        end;
   end;

function buscarArbol(a:arbol; elemento: integer): arbol;
   begin
     if (a=nil) then buscarArbol:=nil
     else if (a^.dato=elemento) then buscarArbol:= a
                              else if (a^.dato>elemento) then buscarArbol:= buscar(a^.HI,elemento)
                                                         else buscarArbol:= buscar(a^.HD,elemento);
   end;

function verMinArbol(a: arbol): integer;
   const retERROR:integer=-1;
   var act: integer;
   begin
   	  if (a = nil) then verMinArbol:= retERROR
   		 else begin
   			act:= verMinArbol(a^.HI);
   			if (act = retERROR) then verMinArbol:= a^.dato
   				else verMinArbol:= act;
   		end;
   end;

function verMaxArbol(a: arbol): integer;
   const retERROR:integer=-1;
   var act: integer;
      begin
   	     if (a = nil) then verMaxArbol:= retERROR
   		 else begin
   			  act:= verMaxArbol(a^.HD);
   			  if (act = retERROR) then verMaxArbol:= a^.dato
   			  else verMax:= act;
   		end;
   end;

Procedure busquedaAcotadaArbol(a: Arbol_Usuarios; inf:integer; sup:integer); 
   begin
     if (a <> nil) then
       if (a^.dato.id >= inf) then
         if (a^.dato.id <= sup) then begin
           write(a^.dato.nombre);
           busquedaAcotadaArbol(a^.hi, inf, sup);
           busquedaAcotadaArbol(a^.hd, inf, sup);
         end
         else
           busquedaAcotadaArbol(a^.hi, inf, sup)
       else
         busquedaAcotadaArbol(a^.hd, inf, sup);
   end;

Procedure borrarElementoArbol(Var a:arbol; valor:integer; Var sePudoEliminar: boolean);
// REQUIERE UN {sePudoEliminar: boolean} EN DONDE SE LO INVOQUE
// REQUIERE verMin y verMax ya implementado

   Var aux:   arbol;
   Begin
       If (a = Nil) Then sePudoEliminar := false
       Else
           // caso: NO encontro el elemento
           If (a^.dato > valor) Then borrarElementoArbol(a^.HI,valor,sePudoEliminar)
   
       Else If (a^.dato < valor) Then borrarElementoArbol(a^.HD,valor,sePudoEliminar)
   
                // caso: Encontro el elemento
       Else
           Begin
               sePudoEliminar := true;
               If (a^.HI = Nil) And (a^.HD = Nil) Then dispose(a);
               // CASO NO TIENE HIJOS
   
               // subCaso (1 hijo solo): solo tiene hijo derecho
               If (a^.HI = Nil) And (a^.HD <> Nil) Then
                   Begin
                       aux := a;
                       a := a^.HD;
                       dispose(aux);
                   End
   
                   // subCaso (1 hijo solo): solo tiene hijo izquierdo
               Else If (a^.HI <> Nil) And (a^.HD = Nil) Then
                        Begin
                            aux := a;
                            a := a^.HI;
                            dispose(aux);
                        End
   
                        // subCaso: tiene ambos hijos
               Else
                   Begin
                       a^.dato := verMin(a^.HD);
                       borrarElementoArbol(a^.HD, a^.dato, sePudoEliminar);
                   End;
   
           End;
   End;
   
   
procedure imprimirRamaLS(a: arbol); // INVOCAR DENTRO DEL RECORRIDO PREORDEN, ENORDEN O POSTORDEN
   var
   	  aux: tipoLista;
	  cont: integer;
   begin
		if (a<>nil) then begin
			cont:= 1;
			with a^.pasajero do begin
				writeln(' DNI :', DNI);
				writeln(' -- Nombre: ', nombre);
				writeln(' -- Apellido: ', apellido);
				writeln(' -- Millas Totales: ', millasTot:2:2);
				aux:= a^.lista;
				while (aux <> nil) do begin
					with aux^.dato do begin
						writeln(' -- Vuelo  ', cont, ':');
						writeln(' ---- Codigo: ', codigo);
						writeln(' ---- Clase: ', clase);
						writeln(' ---- Millas Recorridas: ', millasRecorridas:2:2);
					end;
					cont:= cont + 1;
					aux:= aux^.sig;
				end;
			end;
   	  end;
   end;



Procedure imprimirpornivel(a: arbol);

   Var 
       l, aux, ult:   listaNivel;
       nivel, cant, i:   integer;
   Begin
       l := Nil;
       If (a <> Nil)Then
           Begin
               nivel := 0;
               agregarAtras (l,ult,a);
               While (l<> Nil) Do
                   Begin
                       nivel := nivel + 1;
                       cant := contarElementos(l);
                       write ('Nivel ', nivel, ': ');
                       For i:= 1 To cant Do
                           Begin
                               write (l^.info^.dato, ' - ');
                               If (l^.info^.HI <> Nil) Then agregarAtras (l,ult,l^.info^.HI);
                               If (l^.info^.HD <> Nil) Then agregarAtras (l,ult,l^.info^.HD);
                               aux := l;
                               l := l^.sig;
                               dispose (aux);
                           End;
                       writeln;
                   End;
           End;
   End;

Procedure liberarMemArbol(Var Al: arbol);
// GENERADO POR CHAT GPT

   Var aux:   arbol;
   Begin
       If (Al <> Nil) Then
           Begin
               LiberarMemArbol(Al^.HI);
               // Liberar subárbol izquierdo
               LiberarMemArbol(Al^.HD);
               // Liberar subárbol derecho
               aux := al;
               dispose(aux);
               // Liberar nodo actual
               al := Nil;
               // Asignar nil a la raíz para indicar que el árbol está vacío
           End;
   End;
   
   
Procedure liberarMemArbolLS(Var Al: arbol);
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




Begin
End.
