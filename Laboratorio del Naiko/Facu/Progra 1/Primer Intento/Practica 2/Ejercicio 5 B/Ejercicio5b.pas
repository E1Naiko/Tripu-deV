program Ejercicio5b;
const
  fin = '.';
  A1 = 'a';
  A2 = 'A';
var
  palabra: char;
  suma: integer;
  loop: integer;
begin
  suma:=0;
  read(palabra);
  while(palabra<>fin) do
  begin
       if (palabra=A1) or (palabra=A2) then
       suma:=suma+1;
       read(palabra);
  end;
  writeln('Cantidad de caracteres A en esa secuencia = ', suma);
  read(loop)
end.
