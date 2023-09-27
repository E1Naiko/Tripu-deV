program Tp3Ej1;
{Modulos}
  Function Digitador(N:integer):integer;
    var Max, Dig:integer;
  begin
    Max:=0; Dig:=0;
    While (N>0) do begin
      Dig:= N Mod 10;
      If Max<Dig then Max:=Dig;
      N:= N Div 10;
    end;
    Digitador:=Max;
  end;
{General}
Var F, Num:integer;
begin
  Num:=0; F:=0;
  Readln(Num);
  Writeln(' -- ', Digitador(Num));
  While (F<>1) do begin
    Readln(F);
  end;
end.

