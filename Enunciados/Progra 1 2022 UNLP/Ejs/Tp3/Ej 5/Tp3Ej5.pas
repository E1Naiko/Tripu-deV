program Tp3Ej5;
// Modulos
Procedure Capicua(Num:integer);
var Aux1, Aux2, N:integer;
begin
Aux1:=0; Aux2:=0; N:=Num;
While (N>0) do begin
  Aux1:= N Mod 10;
  Aux2:= Aux2*10; Aux2:=Aux2+Aux1;
  N:=N Div 10;
end;
  If (Num=Aux2) then Writeln(' - El Numero ', Num, ' Es Capicua -') else Writeln(' - El Numero ', Num, ' No Es Capicua -');
end;

Function Retornador(Num, Cant:integer):integer;
  var Aux1, Aux2:integer;
begin
  Aux1:=0; Aux2:=0;
  While (Cant>0) do begin
    Aux1:= Num Mod 10;
    Aux2:= Aux2*10; Aux2:=Aux2+Aux1;
    Num:=Num Div 10;
    Cant:=Cant-1;
  end;
  Retornador:=Aux2;
end;

// General
var F, Num, Inv:integer;
begin
  F:=0; Num:=0; Inv:=0;
  Writeln(' - Escriba el numero que desea analizar, o escriba 0 para finalizar el programa -'); Readln(Num);
  While (Num<>0) do begin
    Capicua(Num);
    Writeln(' - Escriba cuantos digitos desea invertir -'); Readln(Inv);
    Writeln(' - Los ultimos ', Inv, ' digitos invertidos son: ', Retornador(Num,Inv));
    Writeln(' - Tambien sus ultimos 3 digitos invertidos son: ', Retornador(Num,3));
    Writeln(' - y sus ultimos 5 digitos son: ', Retornador(Num,5));
    Writeln(' - Escriba el numero que desea analizar, o escriba 0 para finalizar el programa -'); Readln(Num);
  end;
  Writeln(' - Numero 0 encontrado, finalizando programa --');

  While (F<>1) do begin
    Writeln(' ---- Escriba "1" para cerrar el programa ----'); Readln(F);
  end;
end.

