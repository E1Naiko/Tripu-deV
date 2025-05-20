program Ejercicio_2_Parte_C;
        var
          Max, Min, lluvia, Mes, Anio: integer;
          promedioAnual, promedioMeses: Real;
begin
  Max:=-552341;
  Min:=99999999;
  for Anio:=1 to 5 do begin
    for Mes:=1 to 12 do begin
      read(lluvia);
      if (lluvia<Min) then
         Min:=lluvia;
      if (lluvia>Max) then
         max:=lluvia;
      end;
    Writeln('La cantidad de lluvia máxima del Año ', Anio,' fue en el mes ', Mes,' es de ', Max);
    Writeln(' Y la cantidad de lluvia mínima del Año ', Anio,' es de ', Min, ' Y ocurrio en el Mes ', Mes);
    read(lluvia);
  end;
end.

