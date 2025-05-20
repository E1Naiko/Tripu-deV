program Ejercicio_5;
const
  fin= '.';
type
  caract = set of char;
var
  palabra: char;
  suma: integer;
  conjCar: caract;
  loop: integer;
begin
  suma:=0;
  read(palabra);
  while(palabra<>fin) do
  begin
       suma:=suma+1;
       read(palabra);
  end;
  writeln('Cantidad de caracteres en esa secuencia = ', suma);
  read(loop)
end.
