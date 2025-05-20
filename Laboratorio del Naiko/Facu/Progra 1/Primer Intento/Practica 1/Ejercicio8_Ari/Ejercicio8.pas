program Ejercicio8;
var
  i,n_alumno,n_a_max,ma,nota,nota_max,notas,a:integer;
  pr_max,promedio:real;
begin
  promedio:=0;pr_max:=0;
  repeat
    nota_max:=0;notas:=0;
    write('Inserte numero de alumno= ');
    readln(n_alumno);
    write('Inserte cantidad de materias aprobadas= ');
    readln(ma);
    for i:= 1 to ma do
    begin
    write('Inserte nota de la materias en en el orden establecido anteriormente ');
    readln(nota);
    notas:=notas+nota;
    If(nota>nota_max)then begin
      nota_max:=nota;
    end;
    promedio:=notas/ma;
    If(promedio>pr_max)then
    begin
      n_a_max:=n_alumno;
      pr_max:=promedio;
    end;
    end;
    writeln('Nota max= ',nota_max);
    nota_max:=0;notas:=0;
    write('Inserte un numero para continuar= ');
    read(a);
  until(n_alumno=756);
  write('Alumno con mayor promedio= ',n_a_max);
  readln(a);
end.

