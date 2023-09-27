program Tp4Ej4;
Type
  Cods=0..9999;
  Tipos='A'..'M';
  Producto = record
    Codigo: Cods;
    tipo:Tipos;
    produccion:integer;
    precio:real;
  end;
{Modulos}
   Procedure Iniciar(var P:Producto);
   begin
     P.Codigo:=0;
     P.tipo:='A';
     P.produccion:=0;
     P.precio:=0;
   end;

{Programa}
var
  F, Contador_Alfajores:integer; Promedio, Cont_Promedio:real;
  Actual, Mayor1, Mayor2: Producto;
begin
  // Inicio
  Writeln(' ------------ Fabrica de alfajores Josuelo ------------');
  Writeln(' Iniciando...');
  F:=0; Contador_Alfajores:=0; Promedio:=0; Cont_Promedio:=0; Iniciar(Actual); Iniciar(Mayor1); Iniciar(Mayor2);
  Mayor2.produccion:=1;

  // Programa
  Writeln(' --- Escriba el Codigo del producto que desea ingresar ---'); Readln(Actual.Codigo);
  While (Actual.Codigo<>9999) do begin
    Writeln(' - Escriba el tipo del producto que desea ingresar, "A" para Alfajores o "M" para mermeladas'); Readln(Actual.tipo);
    Writeln(' - Escriba la cantidad producida en el mes'); Readln(Actual.produccion);
    Writeln(' - Escriba el precio por unidad'); Readln(Actual.precio);
    if (Actual.tipo='A') Then Contador_Alfajores:=Contador_Alfajores+Actual.produccion;
    if (Actual.tipo='M') then begin
      Promedio:=Promedio+Actual.precio;
      Cont_Promedio:=Cont_Promedio+1;
    end;
    If (Actual.produccion>Mayor1.produccion) then begin
         Mayor2:=Mayor1; Mayor1:=Actual;
      end else
         if (Actual.produccion>Mayor2.produccion) then Mayor2:=Actual;
    Writeln(' --- Escriba el Codigo del producto que desea ingresar, o ingrese 9999 para calcular el resultado ---'); Readln(Actual.Codigo);
  end;
  Writeln(' ----------------- Codigo 9999 encontrado -----------------'); Writeln();


  // Final
  Writeln(' - La cantidad de alfajores producidos para este mes es ', Contador_Alfajores, ' alfajores');
  if Cont_Promedio>0 then begin
     Promedio:= (Promedio) / (Cont_Promedio);
     Writeln(' - El precio promedio de las mermeladas es de $', Promedio:2:2);
  end else Writeln(' - No se encontraron Mermeladas para promediar');
  if (Mayor2.Codigo<>0) then Writeln(' - El Codigo del producto mas producido es ', Mayor1.Codigo, ', seguido por codigo ', Mayor2.Codigo)
     else if (Mayor1.Codigo<>0) then Writeln(' - El Codigo del producto mas producido es ', Mayor1.Codigo, ', no se encontraron otros productos')
     else Writeln(' - Error: No se encontraron productos para comparar');
  Writeln();
  While (F<>1) do begin
    Writeln(' ---- Escriba "1" para cerrar el programa ----'); readln(F);
  end;
end.

