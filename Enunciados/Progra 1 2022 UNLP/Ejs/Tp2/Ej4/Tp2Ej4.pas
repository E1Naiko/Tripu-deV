program Tp2Ej4;
  var Num, Dig, Res:integer;
begin
  Num:=0; Dig:=0; Res:=0;
  Writeln(' ---- Introduzca el numero a invertir ----');
  Readln(Num);
  While (Num>0) do begin
    Dig:= Num Mod 10;
    Num:= Num Div 10;
    Res:= (Res+Dig)*10;
  end;
  Res:=Res Div 10;
  Writeln(' El mismo numero invertido es: ', Res);
  Writeln(' ---- Precione "Enter" para finalizar el programa ----'); Readln();
end.

