program Tp2Ej8;
var
  F, Cont, Palabras, Cont_R, Cont_T, Cont_RN, Cont_Car, Cont_car_p, Cont_P: integer; // Final, contador de caracteres, contador palabras
                                                                            // comienzan con R, terminan con T, empiezan con R y terminan con N,
                                                                            // cuantos caractes en una palabra, contador de caracteres p,
                                                                            // contador de palabras que cumplen inciso e
  Car, Ant:char;      // caracter, anterior
  Comienza_R:boolean; // condicion: comienza con R
begin
  // --------------------------------------------- Inicio ---------------------------------------------
  Writeln(' ---- Iniciando ----');
  F:=0; Cont:=0; Palabras:=0; Cont_R:=0; Cont_T:=0; Cont_RN:=0; Comienza_R:=false;  Cont_Car:=0; Cont_car_p:=0; Cont_p:=0;

  // --------------------------------------------- Programa ---------------------------------------------
  Writeln(' - Escriba la secuencia de Caracteres');
  Read(Car); Cont:=Cont+1; Ant:=' ';
  // detecto si el caracter es z o ya llegamos a los 500 caracteres
  While (Car<>'z') and (Cont<500) do begin
    // Contador de palabras, inciso A, y verifico si comienza una palabra para el inciso E
    If (Cont>1) and (Ant=' ') then begin
       Palabras:=Palabras+1; Cont_Car:=1;
       end else if (Cont=1) and (Car<>'') then begin
         Palabras:=Palabras+1; Cont_Car:=1;
       end;

    // Contador de palabras que empiezan con R, inciso B
    If (Ant=' ') and (Car='R') then begin
       Cont_R:=Cont_R+1; Comienza_R:=true;
    end;

    // Contador de palabras que terminan con T, inciso C
    If (Ant='T') and (Car=' ') then Cont_T:=Cont_T+1;

    // Chequeo que las palabras comienzan con R y terminan con N, inciso D
    If ((Comienza_R=true) and (Ant='N') and (Car=' ')) Then begin
      Cont_RN:=Cont_RN+1;
      Comienza_R:=false;
    end;

    // Inciso E
    If (Car='p') then Cont_car_p:=Cont_car_p+1;
    if (Car=' ') then begin
       if (Cont_Car<6) and (Cont_car_p=2) then Cont_p:=Cont_p+1;
       Cont_Car:=0;
    end;

    // Siguiente caracter
    Ant:=Car; Read(Car); Cont:=Cont+1;
  end;

  // --------------------------------------------- Final ---------------------------------------------
  Writeln(); Writeln(' --- Resultados ---');
  Writeln(' - Palabras contadas: ', Palabras);
  Writeln(' - Palabras que comienzan con R: ', Cont_R);
  Writeln(' - Palabras que terminan con T: ', Cont_T);
  Writeln(' - Palabras que comienzan con R y terminan con N: ', Cont_RN);
  Writeln(' - Palabras que tienen menos de 6 caracteres y exactamente dos p: ', Cont_p);
  Writeln();

  While (F<>1) do begin
    Writeln(' ---- Escriba 1 para terminar el Programa ----');
    Readln(F);
  end;
end.

