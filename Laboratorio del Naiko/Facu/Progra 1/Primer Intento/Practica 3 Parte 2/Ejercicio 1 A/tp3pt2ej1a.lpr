program tp3pt2ej1a;
procedure Pot(var Base:integer; Exp:integer);  //Potenciador(Base,Exponente)
var
  res:integer; //Resultado
begin
res:=base;
while (Exp<>0) do
      begin
           res:=res*base;
           exp:=exp-1;
           writeln(res);
      end;
end;
var
  i,n:integer;
  loop:integer;
begin
  read(i,n);
  Pot(i,n);
  writeln(i,n);
  read(loop);
end.

