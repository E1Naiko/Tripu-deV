program Tp3Ej3;
{Modulos}
  Function Max4(N1, N2, N3, N4: integer):integer;
    var Max:integer;
    begin
      Max:=0;
      If N1>Max then Max:=N1;
      If N2>Max then Max:=N2;
      If N3>Max then Max:=N3;
      If N4>Max then Max:=N4;
      Max4:=Max;
    end;
  Function Max(N1, N2:integer):integer;
    begin
      If N1>N2 then Max:=N1 else Max:=N2;
    end;

{General}
var
  F:integer;
  {Parte A} NumA1, NumA2, NumA3, NumA4:integer;
  {Parte B} Cont, NumB1, NumB2:integer;
begin
  F:=0;
  // Parte A
  Writeln(' - Iniciando Parte A -');
  NumA1:=0; NumA2:=0; NumA3:=0; NumA4:=0;
  Writeln(' - Escriba el Primer Numero Entero'); Readln(NumA1);
  Writeln(' - Escriba el Segundo Numero Entero'); Readln(NumA2);
  Writeln(' - Escriba el Tercer Numero Entero'); Readln(NumA3);
  Writeln(' - Escriba el Cuarto Numero Entero'); Readln(NumA4);
  Writeln(' ---- Resultado de Max4: ', Max4(NumA1, NumA2, NumA3, NumA4), ' ----');
  Writeln;Writeln;
  // Parte B
  Writeln(' - Iniciando Parte B -');
  Cont:=1; NumB1:=0; NumB2:=0;
  Writeln(' - Escriba su entero numero ', Cont);
  Readln(NumB1);
  For Cont:=2 to 4 do begin
    Writeln(' - Escriba su entero numero ', Cont);
    Readln(NumB2);
    NumB1:=Max(NumB1,NumB2);
  end;
  Writeln(' ---- Resultado de Max: ', NumB1);

  // Final
  Writeln(' ------------- Finalizando -------------');
  While (F<>1) do begin
    Writeln(' ---- Escriba "1" para finalizar el programa ----');
    Readln(F);
  end;
end.

