program Tp1Ej2;
var
  Partidos, MaxPartido, MinPartido:0..135; // variable Partidos para usar de contador, var MaxPartido para guardar el partido con mayor habitantes y MinPartido para el menor.
  Habitantes, Cont, MaxHabi, MinHabi, ContPromedio: integer; // Imput de Habitantes, memoria para el maximo y el minimo de habitantes.
  Promedio, Porcentaje: real;
begin
  Writeln(' ---- Iniciando ---- ');
  // Inicio Variables
  Partidos:=1; MaxPartido:=0; MinPartido:=0;
  Habitantes:=0; Cont:=0; MaxHabi:=0; MinHabi:=99999999; ContPromedio:=0;
  Promedio:=0; Porcentaje:=0;

  // Programa
  Writeln(' -- Contador de Habitantes --');
  Repeat begin  // Primera Pasada
      Writeln(' Por favor, introduzca la cantidad de habitantes del partido Nº ',Partidos);
      Readln(Habitantes); Cont:=Cont+Habitantes;
      if Habitantes>MaxHabi then begin
        MaxHabi:=Habitantes; MaxPartido:=Partidos;
       end
         else if Habitantes<MinHabi then Begin
                MinHabi:=Habitantes; MinPartido:=Partidos;
               end;
      Promedio:=Promedio+Habitantes; If (Habitantes>9999) then ContPromedio:=ContPromedio+1;
      Partidos:=Partidos+1;
    end;
  Until Partidos=135;

  // Resultado
  Writeln('-----Calculando-----'); Writeln();
   {Inciso A}
  Promedio:=Cont/135; Writeln(' - Se calculó un promedio de ', Promedio, ' habitantes por partido');

   {Inciso B}
  If ((MaxHabi=0) and (MinHabi=99999999)) Then Writeln(' - Error - No se encontro diferencia entre los habitantes ingresados') else begin
         Writeln(' - El maximo numero de habitantes encontrados es de ', MaxHabi, ' encontrados en el partido nº ', MaxPartido);
         Writeln(' - El minimo numero de habitantes encontrados es de ', MinHabi, ' encontrados en el partido nº ', MinPartido);
    end;

   {Inciso C}
  if ContPromedio=0 then Writeln(' - No se encontraron ciudades de mas de 10.000 habitantes') else begin
    Porcentaje:=(ContPromedio/135)*100;
    Writeln(' - Un ', Porcentaje, ' % de ciudades tienen mas de 10.000 habitantes');
   end;

  // Final
  Writeln(' ---- Oprima la tecla "Enter" para finalizar el programa ----');
  Readln();
end.

