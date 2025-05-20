program project1;
Var
  Alumno, Materias_A, Contador_Materias, Nota, Nota_Max, Promedio_Max: integer;

begin

     repeat
           Nota_Max:=0;
           Read(Alumno,Materias_A);
           if Materias_A>0 then begin
              for Contador_Materias:=1 to Materias_A do begin
                  Read(Nota);
                  If (Nota>Nota_Max) then begin
                     Nota_Max:=Nota
                  end;

              end;
              end;
           until Alumno=756;
end.

