program Tp1Ej5;
  var
    Peso, PesoMayor, PesoMenor, PromedioMenor, PromedioMayor:real;
    Edad, ContMenores, ContMayores:integer;
begin
  // inicio
  Writeln(' --- Iniciando ---');
  Peso:=0; PesoMayor:=0; PesoMenor:=999999; PromedioMenor:=0; PromedioMayor:=0;
  Edad:=0; ContMenores:=0; ContMayores:=0;

  // Programa
  Writeln('');Writeln(' ----- Seguimiento de Osos Hormigueros -----');Writeln('');
  Writeln(' - Introduzca la edad del Oso a seguir, o introduzca un valor negativo para terminar la operacion');
  Readln(Edad);
  While (Edad>0) or (Edad=0) do begin // Estructura iterativa precondicional, caso positivo cuando la edad es menor a 3
    Writeln(' - Introduzca el Peso  del animal en gr');
    Readln(Peso);
    If (Edad<3) then begin // chequeo si el animal es menor de 3 años y en caso positivo actualizo mis variables
      ContMenores:=ContMenores+1;
      If Peso<PesoMenor then PesoMenor:=Peso;
      PromedioMenor:=PromedioMenor+Edad;
    end else begin // caso contrario el animal es mayor o igual a 3, actualizo mis otras variables
      ContMayores:=ContMayores+1;
      If Peso>PesoMayor then PesoMayor:=Peso;
      PromedioMayor:=PromedioMayor+Edad;
    end;
    {Nueva iteracion}
    Writeln('');Writeln(' - Introduzca la edad del Oso a seguir, o introduzca un valor negativo para terminar la operacion');
    Readln(Edad);
  end;

  // Final
  If (Peso=0) and (PesoMayor=0) and (PesoMenor=999999) then Writeln(' --- ¡No se Introdujo Ningun Animal! ---') else begin
  PromedioMenor:=PromedioMenor/ContMenores;
  PromedioMayor:=PromedioMayor/ContMayores;
  Writeln('');Writeln('--------------------------------------------------------');Writeln('');
  Writeln(' - El Menor peso encontrado para animales menores a 3 años es de ', PesoMenor:2:2, 'gr');
  Writeln(' El Promedio de Animales Menores a 3 años es de ', PromedioMenor:2:2);
  Writeln(' - El Mayor peso encontrado para animales menores a 3 años es de ', PesoMayor:2:2, 'gr');
  Writeln(' El Promedio de Animales Mayores o iguales a 3 años es de ',PromedioMayor:2:2);
  end;
  Writeln('');Writeln('--------------------------------------------------------');Writeln('');Writeln('Precione Enter Para finalizar el programa');
  readln();
end.

