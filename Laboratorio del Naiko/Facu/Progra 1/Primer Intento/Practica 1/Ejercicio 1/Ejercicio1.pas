program Ejercicio1;
  var
    Ingresantes,Maximo,Dias:integer;
  const
    Enero=31;
begin
  Maximo:=0;
  For Dias:=1 to Enero do Begin
    read (Ingresantes);
    if (Maximo<Ingresantes) then Begin
       Maximo:=Ingresantes
    end;
  end;
  Write('Cantidad Maxima de Alumnos Ingresantes es de ', Maximo);
  read(ingresantes)
end.

