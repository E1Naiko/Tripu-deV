program Tp2Ej1E;
  var Cont, Num, Dig, Mayor:integer;

begin
  Cont:=1; Num:=0; Dig:=0; Mayor:=0;
  For Cont:=1 to 100 do begin
    Writeln(); Writeln(' Escriba el numero a desarmar Nº', Cont); Readln(Num);
    While (Num>0) do begin
      Dig:=Num Mod 10;
      If (Dig Mod 2 = 0) then Writeln(' - Digito Par Encontrado: ', Dig);
      If (Dig Mod 3 = 0) then Writeln(' - Digito Multiplo de 3 encontrado: ', Dig);
      If Dig>Mayor then Mayor:=Dig;
      Num:= Num Div 10;
    end;
    Writeln(' - Digito Mayor Encontrado: ', Mayor);
  end;
  Writeln();Writeln(' Se desarmaron mas de 100 numeros, escriba el numero a desarmar Nº', Cont, ' o escriba -1 para finalizar el programa');
  Readln(Num);
  While (Num<>-1) do begin
    While (Num>0) do begin
      Dig:=Num Mod 10;
      If (Dig Mod 2 = 0) then Writeln(' - Digito Par Encontrado: ', Dig);
      If (Dig Mod 3 = 0) then Writeln(' - Digito Multiplo de 3 encontrado: ', Dig);
      If Dig>Mayor then Mayor:=Dig;
      Num:= Num Div 10;
    end;
    Writeln(' - Digito Mayor Encontrado: ', Mayor);
    Cont:=Cont+1;
    Writeln();Writeln(' Se desarmaron mas de 100 numeros, escriba el numero a desarmar Nº', Cont, ' o escriba -1 para finalizar el programa'); Readln(Num);
  end;
  Writeln(' - Numero -1 encontrado, finalizando programa -');
  Writeln(' ---- Precione "enter" para cerrar el programa ----');
  Readln();
end.
