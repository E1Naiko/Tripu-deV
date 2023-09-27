program Tp3Ej7;
// Modulos
   procedure Promediador(cant:integer);
   var
     cont:integer;
     peso, suma:real;
   begin
     cont:=0; peso:=0; suma:=0;
     for cont:=1 to cant do begin
       Writeln(' Introduzca el peso del sujeto ', cont, ' de ', cant, ' en kg.'); Readln(peso);
       suma:=suma+peso;
     end;
     suma:=suma/cant;
     Writeln(' - El Promedio de pesos entre todos los sujetos ingresados es de ', suma:2:2, ' kg por persona');
   end;
var F, Cantidad:integer;
begin
  {Inicio}
  Writeln(' --- Iniciando Programa ---');
  Cantidad:=0; F:=0;

  {General}
  Writeln(' - Escriba la cantidad de personas que desea promediar'); Readln(Cantidad);
  If Cantidad=25 then begin
    writeln(' - Inciso B detectado -'); Promediador(Cantidad);
  end else Promediador(Cantidad);

  {Final}
  While (F<>1) do begin
    Writeln(' --- Escriba "1" para terminar el programa ---'); Readln(F);
  end;
end.

