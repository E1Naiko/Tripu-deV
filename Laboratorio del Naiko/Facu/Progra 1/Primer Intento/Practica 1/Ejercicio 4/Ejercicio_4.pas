program Ejercicio_4;
var
  Especies, Min_Menor, Min_Mayor, Max_Mayor, Max_Menor, Paises, Paises_Mas_30, Paises_Contador: integer;

begin
  Min_Menor:=9999999;
  Min_Mayor:=99999999;
  Max_Mayor:=-2;
  Max_Menor:=-3;
  Paises_Contador:=0;
  for Paises:=1 to 10 do begin
      read(Especies);
      if (Especies<Min_Mayor) then begin
         if (Especies<Min_Menor) then begin
            Min_Menor:=Paises+Paises_Contador;
         end
         else
             Min_Mayor:=Paises;
      end;
      if (Especies>Max_Menor) then begin
         if (Especies>Max_Mayor) then begin
            Max_Mayor:=Paises;
            end
            else begin
                Max_Menor:=Paises;
            end;
      end;

  end;
  writeln('El Pais con Menor Cantidad de especies Animales es ', Min_Menor, ' y el 2do Menor es ', Min_Mayor);
  writeln(' Mientras que el pais con mayor cantidad de especies es ', Max_Mayor, ' y en 2do lugar ', Max_Menor);
  read(Especies);
end.
