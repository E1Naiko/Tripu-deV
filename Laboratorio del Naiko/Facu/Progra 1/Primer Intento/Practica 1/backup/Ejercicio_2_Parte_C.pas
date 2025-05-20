program Ejercicio_2_Parte_C;
        var
          Max, Min, lluvia, Mes, Anio, SiLlovio, LluviaAnual: integer;
          promedioAnual: Real;
begin
  Max:=-552341;
  Min:=99999999;
  LluviaAnual:=0;

  for Anio:=1 to 5 do begin
    SiLlovio:=0;
    for Mes:=1 to 12 do begin
      read(lluvia);
      if (lluvia<Min) then
         Min:=lluvia;
      if (lluvia>Max) then
         max:=lluvia;
      if (lluvia>0) then
         SiLlovio:= SiLlovio+1;
         LluviaAnual:= LluviaAnual+lluvia;
      end;
     promedioAnual:= LluviaAnual / 12;

    Writeln('La cantidad de lluvia máxima del Año ', Anio,' fue en el mes ', Mes,' es de ', Max);
    Writeln(' Y la cantidad de lluvia mínima del Año ', Anio,' es de ', Min, ' Y ocurrio en el Mes ', Mes);
    Writeln('Tambien llovio ', promedioAnual, ' por mes, y de 12 meses llovieron', SiLlovio);
    read(lluvia);
  end;
end.

