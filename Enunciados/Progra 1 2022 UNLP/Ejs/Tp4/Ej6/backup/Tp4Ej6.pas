program Tp4Ej6;
type
  meses = 1..12; sucursales = 0..7;
  Ventas = record
    Bicicletas:integer;
    Monto_Total:real;
    Defectuosas:integer;
    Monto_Devuelto:real;
    Ingresos:real;
  end;
{Modulos}
  Procedure Asignar(Var I:Ventas);
  begin
    Writeln(' - Ingrese la cantidad de bicicletas vendidas en el mes'); Readln(I.Bicicletas);
    Writeln(' - Ingrese el monto total facturado'); Readln(I.Monto_Total);
    Writeln(' - Ingrese la cantidad de bicicletas defectuosas'); Readln(I.Defectuosas);
    Writeln(' - Ingrese el monto devuelto'); Readln(I.Monto_Devuelto);
    I.Ingresos:=I.Monto_Total-I.Monto_Devuelto;
  end;

{Programa}
var
  mes, mayor_mes:meses; Registro:Ventas; Suc, menorsuc: sucursales;
  promedio, mayor, recaudacion_anual, menor:real;
begin
  promedio:=0; menor:=9999999; menorsuc:=0;
  For Suc:=1 to 7 do begin
    mayor:=-9999999; recaudacion_anual:=0;
    Writeln(' ------ Calculando Sucursal numero ', suc,' ------');

    {Meses anteriores a Marzo}
    for mes:=1 to 2 do begin
      Writeln(' ---- Calculando mes nº', mes, ' ----');
      Asignar(Registro);
      recaudacion_anual:=recaudacion_anual+Registro.Ingresos;
      if Registro.Ingresos>mayor then begin
        mayor:=Registro.Ingresos;
        mayor_mes:=mes;
      end;
    end;

    {Marzo}
    Writeln(' ---- Calculando mes nº', mes, ' ----');
    Asignar(Registro);
    recaudacion_anual:=recaudacion_anual+Registro.Ingresos;
    promedio:=promedio+Registro.Ingresos;
    if Registro.Ingresos>mayor then begin
       mayor:=Registro.Ingresos;
       mayor_mes:=mes;
    end;

    {Meses posteriores a Marzo}
    for mes_Num:=4 to 12 do begin
      Writeln(' ---- Calculando mes nº', mes, ' ----');
      Asignar(Registro);
      recaudacion_anual:=recaudacion_anual+Registro.Ingresos;
      if Registro.Ingresos>mayor then begin
        mayor:=Registro.Ingresos;
        mayor_mes:=mes;
      end;
    end;
    If mayor=-9999999 then Writeln(' -- Error --') else Writeln(' --- El Mes que mas se recaudó en la sucursal nº', Suc, ' es el mes', mayor_mes, ' con $' , mayor:2:2, ' recaudados.');
    if recaudacion_anual<menor then begin
      menor:=recaudacion_anual;
      menorsuc:=Suc;
    end;
  end;
  Writeln(); Writeln(' ------------------------------------------------------------- '); Writeln();
  if menorsuc=0 then Writeln(' - Error: Sucursal de menor recaudacion no encontrada.') else
                     Writeln(' - La sucursal con la menor recaudacion es la nº', menorsuc, ' con $', menor:2:2,'recaudados.');
  Writeln(' - La recudacion promedio en marzo de todas las sucursales es $', promedio:2:2);
  Writeln(' --------------------- Precione enter para cerrar el programa ---------------------');
  Readln();
end.

