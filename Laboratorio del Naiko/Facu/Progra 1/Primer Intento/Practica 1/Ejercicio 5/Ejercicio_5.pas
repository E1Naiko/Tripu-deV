program Ejercicio_5;
var
  Codigo_Num, Codigo, Edad, Edad_40, Edad_Max, Contador_Edad_Max: integer;
  Porcentaje: real;

begin
  Edad_Max:=0; Edad_40:=0; Contador_Edad_Max:=0;
  for Codigo_Num:=1 to 998 do begin
    read(Codigo,Edad);
    if (Edad>Edad_Max) then begin
      Edad_Max:=Edad;
      Contador_Edad_Max:=Codigo;
    end;
    If (Edad>40) or (Edad=40) then begin
      Edad_40:=Edad_40+1;
    end;
  end;
  read (Codigo,Edad);
  Porcentaje:= (Edad_40/998);
  Writeln('Edad Maxima encontrada = ', Edad_Max, ' En el Codigo ', Contador_Edad_Max);
  Writeln('Porcentaje de Personas Mayores a 40 = ', Porcentaje , '%');
  read(Edad);
end.

