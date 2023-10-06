{

    10.*Se dispone de un módulo que carga un vector con a lo sumo 2000 nombres de personas, ordenadas
        de forma ascendente. Realice un programa que implemente módulos que reciban dicho vector y
        permitan:
    
    a) Buscar y devolver la posición en la que se encuentra una persona cuyo nombre se recibe como
        parámetro.
        Tener en cuenta que dicha persona puede no existir.
    
    b) Insertar un nombre recibido en el vector conservando su orden. Recuerde validar el espacio.
    
    c) Eliminar un nombre recibido del vector en caso de existir. Considere que no hay nombres
        repetidos.
    
    d) Modifique c) considerando ahora que puede haber repetidos.

}
program tp6Aej10;
uses crt;
const
    DIMF = 2000;
    
type
    cadena = string[50];
    subrPersonas = 0..(DIMF+1); // A DIMF LE AGREGO UNO PARA PODER HACER USO DE BUSQUEDA DICOTOMICA
    arrPersonas = array [1..DIMF] of cadena;
    
    tipoPersonas = record
        dimL: subrPersonas;
        vec: arrPersonas;
    end;
    
// -------------------------------- MODULOS ILEGALES --------------------------------
procedure cargarVectorOrdenado(var personas: tipoPersonas);
    var
        nombre: cadena;
        i, j: subrPersonas;
    begin
        personas.dimL := 0; // Inicializar la dimensión del vector
        writeln('Ingrese los nombres (ingrese "fin" para terminar):');
        readln(nombre);
        
        while (nombre <> 'fin') and (personas.dimL < DIMF) do
        begin
            // Encuentra la posición de inserción
            i := 1;
            while (i <= personas.dimL) and (nombre > personas.vec[i]) do
                i := i + 1;
            
            // Desplaza los elementos mayores hacia la derecha
            for j := personas.dimL downto i do
                personas.vec[j + 1] := personas.vec[j];
            
            // Inserta el nombre en la posición adecuada
            personas.vec[i] := nombre;
            personas.dimL := personas.dimL + 1;
    
            // Lee el siguiente nombre
            readln(nombre);
        end;
    end;
    
procedure imprimirVector(personas: tipoPersonas);
    var
        i: subrPersonas;
    begin
        writeln('Nombres ordenados:');
            for i := 1 to personas.dimL do
                writeln(personas.vec[i]);
    end;

// -------------------------------- MODULOS --------------------------------
procedure buscarPosicionDicotomica(v: tipoPersonas; elem: cadena; var encontre: boolean; var pos: subrPersonas);
    // BUSCQUEDA DICOTOMICA EN VECTOR DE UN ELEMENTO, DEVUELVE POSICION DEL MISMO
    var
        ini, med, fin: subrPersonas;
    begin
        // inicializo encontre y posicion, en caso que no encuentre devolvera estos valores
        encontre:= false; pos:= 0;
        
        // busqueda dicotomica
        ini:= 1; fin:= v.dimL;
        while (ini <= fin) and not(encontre) do begin
            
            med:= (ini + fin) div 2;
            if (v.vec[med] = elem) then
                begin
                    encontre:= true;
                    pos:= med;
                end else
                    if (v.vec[med] < elem) then
                        ini:= med+1
                    else fin:= med-1;
        end;
    end;

procedure insertarOrdenado(var v: tipoPersonas; elem: cadena; pos: subrPersonas; var ok: boolean);
    // INSERTA UN ELEMENTO EN UN VECTOR 
    var
        i: subrPersonas;
    begin
        ok:=false;
        with v do begin
            if (dimL<DIMF) then begin
                ok:= true;
                for i:=pos downto dimL do begin
                    vec[i+1]:= vec[i];
                end;
                vec[i]:=elem;
            end;
        end;
    end;

procedure eliminarElemento(var v: tipoPersonas; pos: subrPersonas; var ok: boolean);
    // ELIMINAR UN ELEMENTO DEL VECTOR
    var
        i: subrPersonas;
    begin
        with v do begin
            for i:=pos to dimL do
                vec[i]:= vec[i+1];
            dimL:= dimL - 1;
        end;
    end;
procedure eliminarElementoRepetidos(var v: tipoPersonas; elem: cadena; var ok: boolean);
    // ELIMINAR TODOS LOS ELEMENTOS INGRESADOS REPETIDOS DEL VECTOR
    var
        pos: subrPersonas;
        okEliminar, encontre: boolean;
    begin
        ok:= false; okEliminar:=true;
		buscarPosicionDicotomica(v, elem, encontre, pos);
        while (encontre) and (okEliminar) do begin
			eliminarElemento(v, pos, okEliminar);
			buscarPosicionDicotomica(v, elem, encontre, pos);
        end;
        if not(encontre) and (okEliminar) then ok:=true;
    end;
// -------------------------------- PROGRAMA PRINCIPAL --------------------------------
var
    personas: tipoPersonas;
    elem: cadena;
    pos: subrPersonas;
    encontre, okInsertar, okEliminar, okEliminar2: boolean; { USO DISTINTOS OK PARA DIFERENCIARLOS, NO ES NECESARIO Y GASTA UN POCO MAS DE MEMORIA}
begin
    clrScr;
    personas.dimL:= 0;
    
    cargarVectorOrdenado(personas); // SE DISPONE
    imprimirVector(personas); // SE DISPONE
    
    
    // RECORRIDO DE LOS EJERCICIOS - los if son innecesarios pero utiles
    
    // EJERCICIO A
    writeln;
    writeln('Introduzca un nombre a buscar:');
    readln(elem);
    buscarPosicionDicotomica(personas, elem, encontre, pos);
    if (encontre) then writeln('Posicion: ', pos)
        else if (personas.dimL = 0) then writeln('ERROR - VECTOR NO CARGADO')
            else writeln('ERROR - PERSONA NO ENCONTRADA');
    
    // EJERCICIO B
    writeln;
    writeln('Introduzca un nombre a insertar:');
    readln(elem);
    
    buscarPosicionDicotomica(personas, elem, encontre, pos);
    if (pos=0) then begin
        pos:=1;
        insertarOrdenado(personas, elem, pos, okInsertar);
    end
    else insertarOrdenado(personas, elem, pos, okInsertar);
    if (okInsertar) then
        imprimirVector(personas)
    else writeln('ERROR - PERSONA NO SE PUDO INSERTAR EL ', elem, ' AL VECTOR');
    
    // EJERCICIO C
    writeln;
    writeln('Introduzca un nombre a eliminar:');
    readln(elem);
    
    buscarPosicionDicotomica(personas, elem, encontre, pos);
    if (pos=0) then
        writeln('ERROR - VECTOR NO CARGADO')
    else begin
        if (encontre) then begin
            eliminarElemento(personas, pos, okEliminar);
            if (okEliminar) then imprimirVector(personas)
            else writeln('ERROR - ELEMENTO NO BORRADO');
        end else
            writeln('ERROR - PERSONA NO ENCONTRADA');
    end;
    
    // EJERCICIO D
    writeln;
    writeln('Introduzca un nombre a eliminar:');
    readln(elem);
    eliminarElementoRepetidos(personas, elem, okEliminar2);
    if (okEliminar) then imprimirVector(personas)
		else writeln('ERROR');
    
    writeln;
    writeln('FIN DEL PROGRAMA');
    readkey;
end.


