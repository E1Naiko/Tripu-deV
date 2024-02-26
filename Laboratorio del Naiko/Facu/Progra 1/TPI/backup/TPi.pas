Program TPI;
Const 
    MAX_MATERIAS =   38;
    fin = 'zzz';

Type
    cadCodigo =   string[6];
    cadNombres =   string[50];
    subrMaterias =   0..MAX_MATERIAS;

    TMateria =   Record
        codigo:   cadCodigo;
        nombre:   cadNombres;
    End;
    arrMaterias =   array[1..MAX_MATERIAS] Of TMateria;

    {para guardar las materias aprobadas y sus notas de cada alumno decidi tener un vector,
	* que guarda codigo y nota, tambien uso el registro TAprobadas para guardar la cantidad de materias
    * que aprobo cada alumno y el vector en si
    }
    matApro = record
		codigo: cadCodigo;
		nota: integer;
	end;
    vecApro = array [1..MAX_MATERIAS] of matApro;
    TAprobadas = record
		dimL: subrMaterias;
		vec: vecApro;
    end;
    
    TAlumno =   Record
        nombre:   cadNombres;
        legajo:   integer;
        matAprobadas:   TAprobadas;
    End;
    
    lista = ^nodo;
    nodo = Record
        datos: TAlumno;
        sig: lista;
    end;
    

Const 
    MATERIAS:   arrMaterias =   (
                               (codigo: 'E0228'; nombre: 'Práctica Profesional Supervisada'),
                              (codigo: 'E0282'; nombre: 'Electrotecnia y Electrónica'),
                              (codigo: 'E0301'; nombre: 'Introducción al Diseño Lógico'),
                              (codigo: 'E0302'; nombre: 'Introducción al Procesamiento de Señales'),
                              (codigo: 'E0303'; nombre: 'Redes de Datos 1'),
                              (codigo: 'E0304'; nombre: 'Instrumentación y Control'),
                              (codigo: 'E0305'; nombre: 'Circuitos Digitales y Microcontroladores'),
                              (codigo: 'E0306'; nombre: 'Taller de Proyecto I'),
                              (codigo: 'F0301'; nombre: 'Matemáticas A'),
                              (codigo: 'F0302'; nombre: 'Matemáticas B'),
                              (codigo: 'F0304'; nombre: 'Matemática C'),
                              (codigo: 'F0307'; nombre: 'Estadistica'),
                              (codigo: 'F0310'; nombre: 'Matemáticas D1'),
                              (codigo: 'F0312'; nombre: 'Probabilidades'),
                              (codigo: 'F0316'; nombre: 'Física I'),
                              (codigo: 'F0317'; nombre: 'Física II'),
                              (codigo: 'I101'; nombre: 'Programación I'),
                              (codigo: 'I102'; nombre: 'Programación II'),
                              (codigo: 'I103'; nombre: 'Programación III'),
                              (codigo: 'I104'; nombre: 'Taller de Lenguajes I'),
                              (codigo: 'I105'; nombre: 'Conceptos de Arquitectura de Computadoras'),
                              (codigo: 'I106'; nombre: 'Conceptos de Sistemas Operativos'),
                              (codigo: 'I107'; nombre: 'Taller de Lenguajes II'),
                              (codigo: 'I108'; nombre: 'Conceptos de Bases de Datos'),
                              (codigo: 'I109'; nombre: 'Taller de Arquitectura'),
                              (codigo: 'I110'; nombre: 'Ingeniería de Software'),
                              (codigo: 'I111'; nombre: 'Concurrencia y Paralelismo'),
                              (codigo: 'I112'; nombre: 'Bases de Datos'),
                              (codigo: 'I113'; nombre: 'Economía y Emprendedorismo'),
                              (codigo: 'I114'; nombre: 'Redes de Datos II'),
                              (codigo: 'I115'; nombre: 'Sistemas de Tiempo Real'),
                              (codigo: 'I116'; nombre: 'Sistemas Distribuidos y Paralelos'),
                              (codigo: 'I117'; nombre: 'Aspectos Legales de Ingeniería Informática'),
                              (codigo: 'I118'; nombre: 'Taller de Proyecto II'),
                              (codigo: 'INFIN'; nombre: 'Inglés (Prueba de Suficiencia)'),
                              (codigo: 'M0670'; nombre: 'Sistemas de Representación'),
                              (codigo: 'S0012'; nombre: 'Seminario de Redacción de Textos Profesionales'),
                              (codigo: 'U0902'; nombre: 'Química')
                              );

    // ---------------- MODULOS ----------------
procedure buscMateria(x: cadCodigo; var retorno: cadNombres); // MODULO EJERCICIO A
   {          Recibe un codigo (string[6]) y la constante MATERIAS,
        en caso de encontrar el codigo recibido en el vector MATERIAS devuelve un string con su nombre,
        caso contrario devuelve un string vacio.
        
            Pascal admite que una funcion devuelva un string, pero como el string no es
            un tipo de dato simple decidi usar un procedure
    }
    Var 
        pri, med, ult: subrMaterias;
    begin
        // inicializo
        pri :=1; ult:= MAX_MATERIAS;
        med:= (pri + ult) div 2;
        
        // recorrido
        while (pri <= ult) and (x <> MATERIAS[med].codigo) do begin
            if (x < MATERIAS[med].codigo) then ult:= med-1
                else pri:= med+1;
            med:= (pri + ult) div 2;
        end;
        
        if (pri <= ult) then retorno:= MATERIAS[med].nombre
            else retorno:= ' ';
    End;
    
function matExiste(mat: TMateria): boolean;  // MODULO EJERCICIO B
{
	Recibe un codigo (string[6]), la constante MATERIAS y una variable booleana:
	* en caso que el codigo pertenezca al vector devuelve el codigo, nombre y encontre en true
	* caso contrario devuelve codigo, nombre vacio y encontre en false

}
    var encontre:boolean;
    begin
        encontre:= false;
        buscMateria(mat.codigo, mat.nombre);
        if (mat.nombre<> ' ') then encontre:= true;
        matExiste:= encontre;
    end;
    
// ---------------- MODULOS EJERCICIO C ----------------
procedure insertarOrd(var pri:lista; t:TAlumno);
var
   nue, ant, act: lista;
begin
     new (nue); nue^.datos:= t; nue^.sig := nil;
     if (pri = nil) then
          pri := nue
     else
     begin
          act := pri; ant := pri;
          while (act<>nil) and (act^.datos.nombre < nue^.datos.nombre) do begin
               ant := act;
               act:= act^.sig;
          end;
          if (ant = act) then
               pri := nue
          else
               ant^.sig := nue;
          nue^.sig := act;
     end;
end;
 
procedure leerAlumno(var alu: TAlumno);
    { 
        Aclaraciones:
          1) Asumo que cada materia se lee 1 unica vez, si quiero chequear por repetidos, debo cambiar el algoritmo de insertar.
          2) Tomo el caso que un alumno pueda no tener materias aprobadas.
          3) Tomo el caso que un alumno no tenga todas las materias disponibles aprobadas, y me aprovecho de la variable fin
               para terminar su lectura.
    }
    procedure leerMateria(var act: TMateria); // lectura de todas las materias que aprobo un alumno dado
        var encontre: boolean;
        begin
            repeat begin
                writeln('Ingrese el codigo de la materia aprobada o "zzz" para continuar:');
                readln(act.codigo);
                if (act.codigo <> fin) then begin
                    encontre:= matExiste(act);
                end;
                if (act.codigo=fin) then encontre:=true // caso que termine la lectura de materias
                   else if not(encontre) then writeln(' - Materia no encontrada.');
            end until encontre;
        end;
        
    var
        act: TMateria;
        
    begin
        with alu do begin
            writeln('Introduzca el nombre del alumno o "zzz" para terminar:');
            readln(nombre);
            if (nombre <> fin) then begin
                writeln('Introduzca el legajo del alumno sin el /:');
                readln(legajo);
                
                // carga de materias aprobadas
                matAprobadas.dimL:= 0;
                leerMateria(act);
                while (act.codigo<>fin) do begin
                    with alu.matAprobadas do begin
                        dimL:= dimL + 1;
                        vec[dimL].codigo:= act.codigo;
                        writeln('Ingrese la nota de la materia:');
                        readln(vec[dimL].nota);
                    end;
                    leerMateria(act);
                end;
                
            end;
        end;
    end;

procedure cargarLista(var lAlu: lista); // generacion de lista y carga de sus datos
	var
		alu: TAlumno;
	begin
		leerAlumno(alu);
		while (alu.nombre<>fin)do begin
			insertarOrd(lAlu, alu);
			leerAlumno(alu);
		end;
	end;

procedure recorrerLista(l: lista);
	// recorre la lista para calcular e informar para cada alumno lo pedido
	procedure imprimirRes(nom: cadNombres; prom: real; mat: matApro);
		// imprime el resultado de cada alumno
		var
			nomMat: cadNombres;
		begin
			writeln('Nombre: ', nom);
			writeln(' - Promedio de notas:', prom:2:2);
			buscMateria(mat.codigo, nomMat);
			writeln(' - Materia con mejor nota:');
			writeln(' -- ', mat.codigo, ': ', nomMat, ', nota: ', mat.nota);
		end;
	var
		sum, prom: real;
		mejorMat: matApro;
		i: subrMaterias;
    begin
		mejorMat.nota:= -1;
		while (l<>nil) do begin
			sum:= 0;
			
			// el ejercicio no lo pide, pero tomo en cuenta el caso que el alumno no tenga materias aprobadas
			if (l^.datos.matAprobadas.dimL = 0) then begin
				mejorMat.codigo:= 'ERROR';
				prom:=0;
			end else begin
			
				// recorro todas las notas aprobadas del alumno y calculo
				with l^.datos.matAprobadas do begin
					for i:=1 to dimL do begin
						sum:= sum + vec[i].nota;
						if (vec[i].nota > mejorMat.nota) then begin
							mejorMat:= vec[i];
						end;
					end;
				end;
				prom:= sum / l^.datos.matAprobadas.dimL;
			end;
			
			imprimirRes(l^.datos.nombre, prom, mejorMat);
			l:=l^.sig;
		end;
    end;
    
// ---------------- MODULOS DE UTILIDAD ----------------
procedure imprimirLista(l: lista);
	var
		i: subrMaterias;
	begin
		writeln('Imprimiendo lista de alumnos: ');
		while (l<>nil) do begin
			with l^.datos do begin
				writeln('Alumno: ', nombre);
				writeln(' - Legajo:', legajo);
				writeln(' - Materias Aprobadas: ');
				with l^.datos.matAprobadas do begin
					if (dimL = 0) then writeln('El alumno no tiene materias aprobadas.')
						else 
							for i:=1 to dimL do
								writeln(' -- Codigo de Materia: ', vec[i].codigo, ', nota: ', vec[i].nota);
				end;
				l:= l^.sig;
			end;
		end;
	end;

procedure liberarMem(var pri:lista);
    var
        aux: lista;
    begin
        while (pri<>nil) do begin
            aux:= pri;
            pri:= pri^.sig;
            dispose(aux);
        end;
    end;
// ---------------- PROGRAMA PRINCIPAL ----------------
Var 
	lAlumnos: lista;
	
Begin
	// inicializo
    lAlumnos:= nil;
    cargarLista(lAlumnos);
    imprimirLista(lAlumnos);
    
    writeln('Imprimiendo Resultados:');
    recorrerLista(lAlumnos);
    
    writeln('-------- Fin del Programa --------'); readln();
    liberarMem(lAlumnos);
End.
