program Tp1Ej4;
  Var  // Variables
    Localidad, LocMin1, LocMin2, LocMax1, LocMax2:0..11;
    Nieve, Min1, Min2, Max1, Max2: integer;
    Promedio, Porcentaje: Real;

begin
  // Inicio
  Writeln(' --- Iniciando ---');
  Localidad:=1; LocMin1:=0; LocMin2:=0; LocMax1:=0; LocMax2:=0;
  Nieve:=0; Min1:=9999999; Min2:=9999998; Max1:=0; Max2:=-1;
  Promedio:=0; Porcentaje:=0;

  // Programa
  Writeln(' -- ');
  While (Localidad<11) do begin
    Writeln(' Introduzca la cantidad de nieve caida en la localidad nº ', Localidad, ' en mm.');
    Readln(Nieve);

    {Calculo Mayores y Menores}
    If (Nieve<Min1) then begin
      Min2:=Min1; Min1:=Nieve; LocMin2:=LocMin1; LocMin1:=Localidad; // 2do menor = 1er menor; 1er menor = actual; localidad del 2do menor = localidad del 1er menor; localidad del 1er menor = localidad actual
    end else if (Nieve<Min2) then begin
      Min2:=Nieve; LocMin2:=Localidad; // 2do menor = actual; Localidad del 2do menor = localidad actual
    end;
    If (Nieve>Max1) then begin
      Max2:=Max1; Max1:=Nieve; LocMax2:=LocMax1; LocMax1:=Localidad;
    end else if (Nieve>Max2) then Begin
               Max2:=Nieve; LocMax2:=Localidad;
    end;

    {Calculo promedio y porcentaje}
    Promedio:=Promedio+Nieve;
    If (Nieve>100) then Porcentaje:=Porcentaje+1;

    {Paso al siguiente}
    Localidad:=Localidad+1;
  end;

  // Final
  Promedio:=Promedio/10;
  Porcentaje:=(Porcentaje/10)*100;
  Writeln;Writeln(' ---------------------------------------------------------------------- ');Writeln;
  Writeln(' En la provincia de Neuquen cayo un promedio de ', Promedio:2:2, 'mm de nieve,');
  Writeln(' con un ', Porcentaje:2:2, '% de localidades superando los 100mm de nieve caida');
  Writeln();
  Writeln(' Localidad con menor nieve caida de ', Min1, 'mm en la localidad nº', LocMin1);
  Writeln(' 2da localidad con menor nieve caida de ', Min2, 'mm en la localidad nº', LocMin2);
  Writeln();
  Writeln(' Localidad con mayor nieve caida de ', Max1, 'mm en la localidad nº', LocMax1);
  Writeln(' 2da localidad con mayor nieve caida de ', Max2, 'mm en la localidad nº', LocMax2);
  readln();
end.

