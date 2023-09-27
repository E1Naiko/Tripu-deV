program Tp1Ej3;
  var
    Carrera:1..11; // Contador general para usar en una estructura iterativa repetitiva
    Alumnos, Duracion, CodCarrera, MinCodCarrera, Cont:integer; // Cant Alumnos, Duracion de la carrera, Codigo de la carrera, Codigo de la carrera con menor cant de alumnos, Contador auxiliar.
    Promedio, MinPromedio:real; // promedio de alumnos por carrera, Carrera de menor promedio.
begin
  // Inicio Variables
  Writeln(' --- Iniciando ---');
  Carrera:=1; Alumnos:=0; Duracion:=0; CodCarrera:=0; MinCodCarrera:=0; Cont:=1;
  Promedio:=0; MinPromedio:=9999999;

  // Programa
  Writeln(' - Promediador de Alumnos -  ');
  Repeat begin
      Writeln(' --- Introduzca el Codigo de la carrera que desea promediar ---');                    // Conteo de Alumnos
      Readln(CodCarrera);
      Writeln(' Promediando carrera de codigo ',
      CodCarrera,' -');
      Writeln(' - Introduzca la Duracion de la Carrrera -');
      Readln(Duracion);
      Writeln(' La Carrera de codigo ', CodCarrera, ' Dura ', Duracion, ' Años');
      While (Cont<Duracion) do begin
          Writeln (' Introduzca la cantidad de ingresantes anotados para el año ', Cont);
          Readln(Alumnos);
          Promedio:=Promedio+Alumnos;
          Cont:=Cont+1;
      end;
      Writeln (' Introduzca la cantidad de ingresantes anotados para el año ', Cont);
      Readln(Alumnos);
      Promedio:=Promedio+Alumnos;
      Promedio:=Promedio/Duracion;
      If (Promedio<MinPromedio) then Begin                                                     // Actualizo la carrera con menor cantidad de alumnos
        MinPromedio:=Promedio;
        MinCodCarrera:=CodCarrera;
       end;
      Promedio:=0; Cont:=1;
      Carrera:=Carrera+1;
  end until Carrera=3;

  // Finalizo
  Writeln(' - La carrera con el menor promedio de alumnos es la codigo ', MinCodCarrera, ' con un promedio de ', MinPromedio, ' alumnos por año');
  Readln();
end.

