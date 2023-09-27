program Tp2Ej3;
  Var Num, Dig, Res:integer;
begin
  Num:=0; Dig:=0; Res:=0;
  Writeln(' Escriba el Numero a desarmar');
  Readln(Num);
  While (Num>9) do begin
    While (Num>0) do begin
      Dig:=Num Mod 10;
      Num:=Num Div 10;
      Res:=Res+Dig;
    end;
    Num:=Res; Res:=0;
  end;
  Writeln();
  Write(' - El resultado es: ', Num, ', o escrito en letras: ');
  Case Num of
    0: Write('Cero');
    1: Write('Uno');
    2: Write('Dos');
    3: Write('Tres');
    4: Write('Cuatro');
    5: Write('Cinco');
    6: Write('Seis');
    7: Write('Siete');
    8: Write('Ocho');
    9: Write('Nueve');
  end;
  Writeln(); Writeln(' ---- Precione "Enter" Para finalizar el programa ----');
  Readln();
end.

