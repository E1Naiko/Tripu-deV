program Trab3Ej3;
function Mayorizador(a,b:integer):boolean;
var
  num:integer; // número
begin
  if a>b then Mayorizador:=true
  else Mayorizador:=false;
end;
var
  num, may, cont:integer; //numero, mayor, contador
  loop:integer; // para que no termine
begin
  may:=-9999999;
  for cont:=1 to 4 do begin
      read(num);
      if Mayorizador(num,may)=true then may:=num;
  end;
  writeln('El numero Mayor es ', May);
  read(loop);
end.

