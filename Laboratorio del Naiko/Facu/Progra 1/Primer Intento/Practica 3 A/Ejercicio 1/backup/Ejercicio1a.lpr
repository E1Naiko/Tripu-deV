program Ejercicio_1;
        procedure Groso(var num:integer); // numero
        var
           may,dig:integer; // mayor, digito
        begin
          may:=-9999;
          while num<>0 do begin
                dig:=num mod 10;
                if may<dig then may:=dig; // redefinir el mayor
                num:=(num-dig) div 10;
                writeln (num, ' ', dig, ' ', may);
          end;
          num:=may;
          writeln (num);
          end;
var
  entero:integer;
  loop: integer; // PARA QUE NO SALGA AL TOQUE
begin
  read(entero);
  groso(entero);
  writeln('El digito mayor del numero es ', entero);
  read(loop);
end.

