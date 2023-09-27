program Tp2Ej8;
var
  F, Cont, Palabras, Cont_R, Cont_T, Cont_RN, Cont_Car, Cont_p: integer; // Final, contador de caracteres, contador palabras
                                                                         // comienzan con R, terminan con T, empiezan con R y terminan con N, cuantos caractes en una palabra, contador de p
  Car, Ant:char;      // caracter, anterior
  Comienza_R:boolean; // condicion: comienza con R
begin
  F:=0; Cont:=0; Palabras:=0; Cont_R:=0; Cont_T:=0; Cont_RN:=0; Comienza_R:=false; Car:=Nil;
  While (Car<>z) and (Cont<499) do begin
    Read(Car); Cont:=Cont+1;
    If (Cont>1) and (Ant='') then Palabras:=Palabras+1 else if (Cont=1) and (Car<>'') then Palabras:=Palabras+1; // Contador de palabras, inciso A
    If (Ant='') and (Car='R') then begin // Contador de palabras que empiezan con R, inciso B
       Cont_R:=Cont_R+1; Comienza_R:=true;
    end;
    If (Ant='T') and (Car='') then Cont_T:=Cont_T+1; // Contador de palabras que terminan con T, inciso C
    If (Comienza_R=True) and (Ant='N') and (Car='') Then begin // Chequeo que las palabras comienzan con R y terminan con N, inciso D
      Cont_RN:=Cont_RN+1;
      Comienza_R:=false
    end;

  end;
  Writeln();
  While (F<>1) do begin
    Writeln(' ---- Escriba 1 para terminar el Programa ----');
    Readln(F);
  end;
end.

