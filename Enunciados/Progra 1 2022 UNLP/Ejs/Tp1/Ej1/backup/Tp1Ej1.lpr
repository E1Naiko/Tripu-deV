program Tp1Ej1;
        var
          Cont, ImputCant, maxGente: integer; ContHs, maxHora: 0..24;
begin
  // Inicializo
  Cont:=0; ImputCant:=0; maxGente:=0; maxHora:=0; ContHs:=1;

  // Programa
  // Primeras 23 Hs
  Writeln('-- Contador de Ingresos --');
  While ContHs<24 Do begin
        Writeln('Por favor introduzca cuantas personas ingresarion a las ', ContHs, ' hs del dia');
        ReadLn(ImputCant); Cont:=Cont+ImputCant;
        If maxGente<ImputCant then Begin
           MaxGente:=ImputCant; MaxHora:=ContHs;
        end;
        ContHs:= ContHs+1;
  end;
  // Ultimo chequeo
  Writeln('Por favor introduzca cuantas personas ingresarion a las ', ContHs, ' hs del dia');
  ReadLn(ImputCant); Cont:=Cont+ImputCant;
  Writeln(' --- La Maxima Cantidad de Gente que Ingreso al edificio es ', maxGente, ' a las ', maxHora, ' Hs ---');
  Writeln(' --- La Cantidad total de Gente que Entró al Edificio es de ', Cont, ' Personas.');
  writeln('Presione la tecla "Enter" para finalizar...');
  readln();
end.

