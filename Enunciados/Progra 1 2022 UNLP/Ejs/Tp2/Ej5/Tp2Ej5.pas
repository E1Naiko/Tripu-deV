program Tp2Ej5;
  Var
    Car, Ant: char;
    F, Cont, Cont_A, Cont_sa:integer;
begin
  Cont:=0; Cont_A:=0; Cont_sa:=0; F:=0;
  Read(Car);
  While (Car <> '.') do begin
    Ant:=Car;
    Cont:=Cont+1;
    Read(Car);
    If (Ant='s') and (Car='a') then Cont_sa:=Cont_sa+1;
    If Car='A' then Cont_A:=Cont_A+1;
  end;
  Writeln(' Caracteres contados ', Cont);
  Writeln(' Caracteres "A" contados ', Cont_A);
  Writeln(' "sa" contados ', Cont_sa);
  While (F<>1) do begin
    Writeln(' ---- Escriba "1" para finalizar el programa ----');
    Readln(F);
  end;
end.

