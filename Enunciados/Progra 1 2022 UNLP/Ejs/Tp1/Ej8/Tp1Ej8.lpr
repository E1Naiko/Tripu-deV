program Tp1Ej8;
  var
    Alumno, AlumnoMax, Materias, Cont: integer;
    Nota, Promedio, PromedioMax, NotaMax: real;
begin
  //Inicio
    Writeln(' ----- Iniciando -----');
    Alumno:=0; AlumnoMax:=0; Materias:=0; Cont:=0;
    Nota:=0; Promedio:=0; PromedioMax:=0; NotaMax:=0;
  //Programa
    While (Alumno<>756) do begin
      Writeln();Writeln(' Escriba el numero de alumno a procesar'); Readln(Alumno);
      Writeln(' Escriba la cantidad de materias aprobadas'); Readln(Materias);
      for Cont:=1 to Materias do begin
        Writeln(' Escriba la nota de la materia numero ',Cont); Readln(Nota);
        Promedio:=Promedio+Nota;
        If Nota>NotaMax then NotaMax:=Nota;
      end;
      Writeln(' La mayor nota conseguida por el/la alumno/a es ', NotaMax:2:2);
      Promedio:=Promedio/Materias;
      if Promedio>PromedioMax Then begin
        PromedioMax:=Promedio; AlumnoMax:=Alumno;
      end;
      Promedio:=0; NotaMax:=0;
    end;

  //Final
  Writeln(); Writeln(' ----------------------------------------- '); Writeln();
  Writeln(' - El/La Alumno/a con mayor promedio encontrado es el/la numero ', AlumnoMax, ' con un promedio de ', PromedioMax:2:2);
  Readln();
end.

