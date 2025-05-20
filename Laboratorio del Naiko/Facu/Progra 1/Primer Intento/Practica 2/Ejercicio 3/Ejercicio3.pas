program Ejercicio3;
var
  numero,ct,suma,sumaDi,sumaNu,digito:integer; //ct:=contador, sumaDi:= Digito de la Suma, sumaNu:= Numero Adicional para las cuentas de la suma
  Loop:integer; //Para que no se cierre solo el programa

begin
  for ct:=1 to 10 do begin
  sumaNu:=0;
  read(numero);
  suma:=0;
  while numero>0 do begin // para romper el numero
        digito:=numero mod 10;
        suma:=suma+digito;
        numero:=(numero-digito) div 10;
        end;
  while suma>9 do begin  // para romper la suma
        sumaDi:= Suma mod 10;
        sumaNu:=(Suma-SumaDi) div 10;
        suma:=SumaDi+SumaNu;
        end;
  writeln('Proceso numero ',ct,'/10');  //Cotador de Procesos
  writeln(' cifra = ', suma); // Escritura de los Números
  case suma of
      1: writeln(' o el numero Uno');
      2: writeln(' o el numero Dos');
      3: writeln(' o el numero Tres');
      4: writeln(' o el numero Cuatro');
      5: writeln(' o el numero Cinco');
      6: writeln(' o el numero Seis');
      7: writeln(' o el numero Siete');
      8: writeln(' o el numero Ocho');
      9: writeln(' o el numero Nueve');
  end;
  end;
  writeln('Pulse Cualquier Numero Para Finalizar El Programa'); //Loop
  read(Loop);
  Loop:=Loop;
end.
