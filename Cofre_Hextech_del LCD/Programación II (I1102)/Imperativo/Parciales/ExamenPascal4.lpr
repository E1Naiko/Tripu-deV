{Enunciado
La Facultad de Informática posee un listado con la información de los alumnos de sus carreras de Licenciaturas y
Analistas. De cada alumno se conoce: nombre y apellido, legajo, carrera junto a la materia que aprobó. De cada
materia se conoce: código, nombre, nota y fecha de aprobación (día, mes y año). Esta información se lee desde teclado
ordenada por legajo de alumno hasta que llegue el legajo “0000/0”. }

program ExamenPascal4;
const
    FIN= '000/0';
type
    fecha= record
      dia: integer;
      mes: integer;
      anho: integer;
    end;

    materia = record
            codigo: integer;
            nombre: string;
            nota: integer;
            fechaAprobacion: fecha;
    end;

    alumno= record
      nombreApellido: string;
      legajo: string;
      carrera: string;
      materiaAprobada: materia;
    end;

    alumnos = record
            legajo: string;
            nombreApellido: string;
            carrera: string;
            nota: integer;
            fechaAprobacion: fecha;
    end;

    listaAlumnos = ^nodoAlumno;
    nodoAlumno= record
                dato: alumnos;
                sig: listaAlumnos;
      end;

    materias = record
      codigo: integer;
      nombre: string;
      alumnosAprobado: listaAlumnos;
    end;

    arbolMateria = ^nodoMateria;
    nodoMateria = record
                dato: materias;
                HI,HD: arbolMateria;
    end;


{a) Realizar un módulo que procese la información descripta anteriormente y genere una nueva estructura donde
para cada materia se guarde su código, nombre y la información de los alumnos que aprobaron dicha
asignatura. De cada alumno interesa almacenar el legajo, nombre y apellido, la carrera junto a la nota y fecha
de aprobación de la materia. Esta estructura debe estar ordenada por código de materia y debe ser eficiente
para la búsqueda por dicho criterio. }

procedure CargarFecha (var f:fecha);
begin
     readln(f.dia);
     readln(f.mes);
     readln(f.anho);
end;

procedure CargarMateria (var m:materia);
var
  f: fecha;
begin
     with m do begin
          writeln('Codigo Materia');
          readln(codigo);
          writeln('Nombre Materia');
          readln(nombre);
          writeln('Nota Materia');
          readln(nota);
          writeln('Fecha de Aprobacion');
          CargarFecha(f);
     end;
end;

procedure CargarAlumno (var a:alumno);
var
  m: materia;
begin
     with a do begin
          writeln('Ingresar Legajo:');
          readln(legajo);
          if (legajo <> FIN) then begin
             writeln('Nombre Alumno: ');
             readln(nombreApellido);
             writeln('Carrera');
             readln(carrera);
             writeln('Materia que Aprobo');
             CargarMateria(m);
          end;
     end;
end;

procedure AgregarAdelante (var l:listaAlumnos; al:alumno);
var
   nue: listaAlumnos;
begin
     new(nue);
     nue^.dato.legajo:= al.legajo;
     nue^.dato.nombreApellido:= al.nombreApellido;
     nue^.dato.carrera:= al.carrera;
     nue^.dato.nota:= al.materiaAprobada.nota;
     nue^.dato.fechaAprobacion:= al.materiaAprobada.fechaAprobacion;
     nue^.sig:= l;
     l:= nue;
end;

procedure InsertaNodo (var a:arbolMateria; al:alumno);
begin
     if(a <> nil) then begin
        new(a);
        a^.dato.codigo:= al.materiaAprobada.codigo;
        a^.dato.nombre:= al.materiaAprobada.nombre;
        a^.dato.alumnosAprobado:= nil;
        AgregarAdelante(a^.dato.alumnosAprobado,al);
        a^.HD:= nil;
        a^.HI:= nil;
        end else
         if (a^.dato.codigo > al.materiaAprobada.codigo) then
	    InsertarNodo(a^.HI, al)
	    else if (a^.dato.codigo < al.materiaAprobada.codigo) then
	         InsertarNodo(a^.HD, al)
	    else begin
            AgregarAdelante(a^.dato.alumnosAprobado,al);
            end;
     end;

procedure CrearArbol (var a:arbolMateria);
var
   al:alumno;
begin
     CargarAlumno(al);
     while (al.legajo <> FIN) do begin
          InsertarNodo(a,al);
          CargarAlumno(al);
     end;
end;

{Al finalizar el procesamiento de a), se pide:
b) Implementar un módulo que informe el nombre de materia junto al porcentaje de alumnos que aprobaron con
nota mayor a 7 y que pertenecen a la carrera “LS” (Licenciatura en Sistemas). }

procedure VerificarMateria(m:materias; var mat:string; var por:real);
var
   aux: listaAlumnos;
   tot,cant:integer;
   begin
        tot:= 0; cant:= 0;
        aux:= m.alumnosAprobado;
        while ( aux <> nil) do begin
             tot:= tot + 1;
             if (aux^.dato.nota > 7) and (aux^.dato.carrera = 'LS') then begin
                cant:= cant + 1;
             end;
             aux:= aux^.sig;
        end;
        por:= (tot/100)*cant;
   end;

procedure InformarMateria (a:arbolMateria);
var
   mat: string;
   por: real;
begin
     por:= 0;
     if(a<>nil) then begin
                InformarMateria(a^.HI);
                VerificarMateria(a^.dato,mat,real);
                InformarMateria(a^.HD);
     end;
     writeln('La materia: ',mat,' tiene el ',por,' porciento de alumno que aprobaron');
end;

{c) Implementar un módulo que retorne la cantidad total de alumnos que aprobaron en el trimestre de Abril a
Junio para las materias con código entre 25 y 33. }

procedure ProcesarMateria (m:materias);
var
   aux: listaAlumnos;
   cant: integer;
begin
     cant:=0;
     aux:= m.alumnosAprobado;
     while (aux <> nil) do begin
          if((aux^.dato.fechaAprobacion >= 4) and (aux^.dato.fechaAprobacion <= 6) then begin
                     cant:= cant + 1;
          end;
          aux:= aux^.sig;
     end;
     writeln('La materia ',m.nombre,' tiene ',cant,' alumnos que aprobaron el trimestre');
end;

procedure BusquedaMateria (a:arbolMateria; inf,sup:integer);
begin
   if (a <> nil) then
      if (a^.dato.codigo >= inf) then begin
        if (a^.dato.codigo <= sup) then begin
          BuscarNombres(a^.HI,inf,sup);
          ProcesarMateria(a^.dato);
          BuscarNombres(a^.HD,inf,sup);
        end
        else
           BuscarNombres(a^.HI,inf,sup);
      end
      else
         BuscarNombres(a^.HD,inf,sup);
end;

{d) Implementar un módulo que imprima el código de materia que posee más alumnos aprobados}

procedure ImprimirCodMateria (a:arbolMateria);
var
   maxMat: integer;
begin
   if(a <> nil) then begin
        ImprimirCodMateria(a^.HI);

        ImprimirCodMateria(a^.HD);
   end;

end;
begin
end.

