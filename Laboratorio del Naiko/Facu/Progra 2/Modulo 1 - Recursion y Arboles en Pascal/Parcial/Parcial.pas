{
   
}


program nicolasPenalba;

//ARBOL DE LISTAS
        tipoLista = ^nodoLS;
        nodoLS = record
                dato: integer;
                sig: tipoLista;
        end;
        
        arbol =   ^nodoA;
        nodoA =   Record
                DATOCAMBIAR: integer; // ORDEN DEL ARBOL
                REGISTROEXTRA: integer;
                lista : tipoLista;
                HI:   arbol;
                HD:   arbol;
        End;
BEGIN
	
	
END.

