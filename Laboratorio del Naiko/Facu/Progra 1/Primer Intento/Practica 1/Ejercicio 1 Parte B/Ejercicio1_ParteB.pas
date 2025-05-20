program Ejercicio1_ParteB;
var
  Ingresantes, Max, Dias, MaxDias:integer;
const
  Enero=31;
begin
  max:=0;
  for Dias:=1 to Enero do Begin
    read(Ingresantes);
    if (Max<Ingresantes) then Begin
      Max:=Ingresantes;
      MaxDias:= Dias;
    end;
  end;
  writeln('cant ingre max ', Max);
  writeln('en el dia ', MaxDias);
  read(ingresantes);
end.

