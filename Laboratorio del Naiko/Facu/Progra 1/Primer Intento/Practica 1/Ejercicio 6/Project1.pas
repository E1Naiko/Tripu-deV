program Ejercicio_6;
  var
     Codigo, Ventas, Mas_Ventas, Mas_Ventas_C, Precio, Mas_Recaudo, Mas_Recaudo_C: integer;
begin
  Mas_Ventas:= 0;
  Mas_Recaudo:= 0;
  read(Codigo, Ventas, Precio);
  While (Codigo>0) do begin
     if (Ventas>Mas_Ventas) then begin
       Mas_Ventas:=Ventas;
       Mas_Ventas_C:=Codigo;
     end;
     If ((Precio*Ventas)>Mas_Recaudo) then begin
       Mas_Recaudo:=(Precio*Ventas);
       Mas_Recaudo_C:=Codigo;
     end;
     read(Codigo,Ventas,Precio);
  end;
  Writeln('Producto Que Vendio Mas Veces = Codigo_', Mas_Ventas_C, ' Con ', Mas_Ventas, ' Ventas');
  Writeln('Producto que Mas Recaudo = Codigo_', Mas_Recaudo_C, ' Con ', Mas_Recaudo, '$ Recaudados');
  read (Codigo)
end.

