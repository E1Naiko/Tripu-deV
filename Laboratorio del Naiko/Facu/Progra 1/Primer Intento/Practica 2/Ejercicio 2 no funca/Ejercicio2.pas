program Ejercicio2;
var
   numero,NumProceso,digito,mayor1,mayor2,suma:integer;
begin
  while not (numero=8888) do begin
  suma:=0;
  mayor1:=0;
  mayor2:=0;
  writeln('ingrese valor');
  read(numero);
  repeat
     NumProceso:=numero;
     digito:=(NumProceso mod 10);
     numero:= (NumProceso-digito) div 10;
     suma:=suma+digito;
     if mayor1<digito then begin
        mayor2:=mayor1;
        mayor1:=digito;
        end
     else
        if mayor2<digito then begin
        mayor2:=digito;
        end;
     until NumProceso=0;
     Writeln('digito mayor es ',mayor1, ' y el 2do digito mayor es ', mayor2);
     Writeln('y la suma de sus digitos da ', suma);
     Writeln();
     Writeln('-----------------------------------------------------------------');
     Writeln();
  end;
  Writeln('Programa Finalizado');
  read(numero)
end.

