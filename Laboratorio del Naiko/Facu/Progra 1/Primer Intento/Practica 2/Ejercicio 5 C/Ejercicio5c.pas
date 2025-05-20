program Ejercicio5c;
const
  fin = '.';
  A1 = 'a';
  A2 = 'A';
  S1 = 's';
  S2 = 'S';
var
  palabra: char;
  suma, sumaA, sumaS: integer;
  loop: integer;
begin
  suma:=0;
  sumaA:=0;
  sumaS:=0;
  read(palabra);
  while(palabra<>fin) do
  begin
       suma:=suma+1;
       if (palabra=A1) or (palabra=A2) then // A a
          sumaA:=sumaA+1;
       if (palabra=S1) or (palabra=S2) then // Sa SA sA sa
          read(palabra);
          if (palabra=A1) or (palabra=A2) then
             sumaS:=sumaS+1;
       read(palabra);
  end;
  writeln('Cantidad de caracteres en esa secuencia = ', suma);
  writeln('Cantidad de caracteres A en esa secuencia = ', sumaS);
  writeln('Cantidad de caracteres SA en esa secuencia = ', sumaA);
  read(loop); // loop
  loop:=loop;
end.
