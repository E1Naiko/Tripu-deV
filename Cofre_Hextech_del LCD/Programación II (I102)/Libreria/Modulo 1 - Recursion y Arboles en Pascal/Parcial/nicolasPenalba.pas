{
ACLARACIONES:
   - Asumo que los montos se manejan en numeros reales positivos
}

program nicolasPenalba;
const
   FINCUIT = '99-99999999-9';
   ERRORMONTO = 0;
   constINFBUSQUEDA = '20-20000000-2';
   constSUPBUSQUEDA = '30-30000000-3';

type
   strMedio = string[9];
   strNomApe = string[50];
   strCuit = string[13];
   
   tipoFecha = record
      dia: 1..31;
      mes: 1..12;
      anio: 2012..2025;
   end;

   tipoDueno = record
      nomApe: strNomApe;
      cuit: strCuit;
   end;
   
   tipoViaje = record
      identificador: integer;
      numTarj: longInt;
      fecha: tipoFecha;
      monto: real;
      medio: strMedio;
      dueno: tipoDueno;
      cuit: strCuit;
   end;

   
   //ARBOL DE LISTAS
   tipoDatosLista = record
      identificador: integer;
      fecha: tipoFecha;
      monto: real;
      medio: strMedio;
   end;

   tipoDatosPasajero = record
      nomApe: strNomApe;
      numTarj: longInt;
      viajesRealizados: integer;
   end;
   
   lista = ^nodo;
    nodo = record
        dato: tipoDatosLista;
        sig: lista;
    end;
    Tlista = record
        pri, ult: lista;
    end;
        
   arbol =   ^nodoA;
   nodoA =   Record
      CUIT: strCuit; // ORDEN DEL ARBOL
      pasajero: tipoDatosPasajero;
      lista : TLista;
      HI:   arbol;
      HD:   arbol;
   End;

   // ---------------------- Manejo de Estructura ----------------------

   Procedure agregarFinalLS(Var l: Tlista; elem: tipoViaje);
      Var nue:   lista;
      Begin
         new(nue);
         nue^.dato.identificador := elem.identificador;
         nue^.dato.fecha := elem.fecha;
         nue^.dato.monto := elem.monto;
         nue^.dato.medio := elem.medio;
         nue^.sig := Nil;
      
         If (l.pri=Nil) Then l.pri := nue
         Else l.ult^.sig := nue;
         l.ult := nue;
      End;

   procedure insertarEnRamaArbolDeListas(var a: arbol; elemento: tipoViaje);
   // toma un elemento y lo inserta en una rama de un arbol de listas
      begin
         if (a = nil) then begin
            new(a);
            a^.cuit:= elemento.cuit;
            with a^.pasajero do begin
               nomApe:= elemento.dueno.nomApe;
               numTarj:= elemento.numTarj;
               viajesRealizados:= 1;
            end;
            agregarFinalLS(a^.lista, elemento);
            a^.HD:= nil;
            a^.HI:= nil;
         end else
            if (a^.cuit > elemento.dueno.cuit) then
               insertarEnRamaArbolDeListas(a^.HI, elemento)
            else if (a^.cuit < elemento.dueno.cuit) then
                  insertarEnRamaArbolDeListas(a^.HD, elemento)
               else begin
                  agregarFinalLS(a^.lista, elemento);
                  a^.pasajero.viajesRealizados:= a^.pasajero.viajesRealizados + 1;
               end;
      end;

   procedure imprimirRamaLS(a: arbol); // DEBUG
   // INVOCAR DENTRO DEL RECORRIDO PREORDEN, ENORDEN O POSTORDEN
      var
         aux: lista;
         cont: integer;
      begin
         if (a<>nil) then begin
            cont:= 1;
            writeln(' CUIT :', a^.cuit);
            with a^.pasajero do begin
               writeln(' -- Nombre y Apellido: ', nomApe, ' - Numero de Tarjeta: ', numTarj, ' - Viajes Realizados: ', viajesRealizados);
               aux:= a^.lista.pri;
               while (aux <> nil) do begin
                  with aux^.dato do begin
                     writeln(' -- LISTA  ', cont, ':');
                     writeln(' ---- Identificador: ', identificador,' - fecha: ', fecha.dia, '/', fecha.mes, '/', fecha.anio,' -  monto: ', monto:2:2,' - medio: ', medio);
                  end;
                  cont:= cont + 1;
                  aux:= aux^.sig;
               end;
            end;
         end;
      end;

   procedure imprimirArbol(a: arbol); // DEBUG
      begin
         imprimirArbol(a^.HI);
         imprimirRamaLS(a);
         imprimirArbol(a^.HD);
      end;

   procedure leerViaje(var act: tipoViaje; var fin: boolean);
      var aux: integer;
      begin
         with  act do begin
            writeln(' - CUIT (formato: 00-11111111-2) o introduzca ', FINCUIT, ' para terminar: '); readln(dueno.cuit);
            if (dueno.cuit <> FINCUIT) then begin
               writeln(' -- Nombre y Apellido:'); readln(dueno.nomApe);
               writeln(' -- Identificador:'); readln(identificador);
               writeln(' -- Numero de Tarjeta:'); readln(numTarj);
               writeln(' -- Dia:'); readln(fecha.dia);
               writeln(' -- Mes:'); readln(fecha.mes);
               writeln(' -- Anio:'); readln(fecha.anio);
               writeln(' -- Monto:'); readln(monto);
               writeln(' -- Medio: 1)Tren, 2)Colectivo, 3)Subte'); readln(aux);
               while not(aux in [1..3]) do readln(aux);
               case aux of
                  1: medio:= 'tren';
                  2: medio:= 'colectivo';
                  3: medio:= 'subte';
               end;
            end else fin:= true;
         end;
      end;

   procedure cargarArbol(var a: arbol);
      var
         termine: boolean;
         act: tipoViaje;
      begin
         termine:=false;
         leerViaje(act,termine);
         while not(termine) do begin
            insertarEnRamaArbolDeListas(a,act);
            leerViaje(act,termine);
         end;
      end;

   // ---------------------- Incisos ----------------------
         
   procedure masGasto(a: arbol; var actNomApe: strNomApe; var actGasto: real);
   // inciso B
      var
         aux: lista;
         gasto: real;
      begin
         // DE MENOR A MAYOR
         if (a <> nil) then begin
            masGasto(a^.HI, actNomApe, actGasto);
            masGasto(a^.HD, actNomApe, actGasto);

            // Calculo el gasto del pasajero
            gasto:=0;
            aux:= a^.lista.pri;
            while (aux <> nil) do begin
               gasto:= gasto + aux^.dato.monto;
               aux:= aux^.sig;
            end;

            // Actualizo resultados
            if (gasto > actGasto) then begin
               actNomApe:= a^.pasajero.nomApe;
               actGasto:= gasto;
            end;
         end;
      end;

   Procedure busquedaAcotadaArbol(a: arbol; inf: strCuit; sup: strCuit);
      begin
      if (a <> nil) then
         if (a^.cuit >= inf) then
            if (a^.cuit <= sup) then begin
               busquedaAcotadaArbol(a^.hi, inf, sup);
               writeln(' - CUIT: ', a^.cuit, ', Nombre y Apellido: ', a^.pasajero.nomApe, ', Viajes Realizados: ', a^.pasajero.     viajesRealizados);
               busquedaAcotadaArbol(a^.hd, inf, sup);
            end
            else
               busquedaAcotadaArbol(a^.hi, inf, sup)
         else
            busquedaAcotadaArbol(a^.hd, inf, sup);
      end;

   

   // ---------------------- PROGRAMA PRINCIPAL ----------------------
   
var
   a: arbol;
   incisoB_Monto: real;
   incisoB_NomApe: strNomApe;
   infBusqueda, supBusqueda: strCuit;
BEGIN
   a:= nil;

   cargarArbol(a);
   if (a = nil) then writeln('ERROR - ARBOL NO CARGADO')
      else begin
         imprimirArbol(a); // DEBUG
         
         // INCISO B
         incisoB_Monto:= ERRORMONTO;
         incisoB_NomApe:= 'ERROR';
         masGasto(a, incisoB_NomApe, incisoB_Monto);
         if (incisoB_Monto = ERRORMONTO) then writeln('ERROR - Mayor gasto no encontrado')
            else writeln('El Mayor Gasto encontrado es de $', incisoB_Monto:2:2, ' por ', incisoB_NomApe);

         // Inciso C
         // en caso que se quiera leer desde teclado solo remover constINF y constSUP
         infBusqueda:= constINFBUSQUEDA;
         supBusqueda:= constSUPBUSQUEDA;
         busquedaAcotadaArbol(a, infBusqueda, supBusqueda);
      end;
	
	writeln('FIN DEL PROGRAMA'); readln();
END.

