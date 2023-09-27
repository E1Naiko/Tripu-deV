program Tp4Ej1;
{Modulos}
  function Area(W, H, L: real): real;
  var res:real;
  begin
    res:=(2*H*L)+(2*H*W)+(2*L*W);
    Area:=res;
  end;
  function Vol(W, H, L:real):real;
  var res:real;
  begin
    res:=W*H*L;
    Vol:=res;
  end;
var
  f:integer;
  Prisma: record
    ancho:real;
    alto:real;
    profundidad:real;
  end;
begin
  f:=0; Prisma.alto:=0; Prisma.ancho:=0; Prisma.profundidad:=0;
  Writeln(' - Por Favor, escriba el ancho del primsa'); readln(Prisma.ancho);
  Writeln(' - Por Favor, escriba el alto del prisma'); readln(Prisma.alto);
  Writeln(' - Por Favor, escriba la profundidad del prisma'); readln(Prisma.profundidad);
  Writeln(' ---- Calculando ----');
  Writeln(' - El Volumen ocupado por el prisma rectangular introducido es: ', Vol(Prisma.profundidad, Prisma.alto, Prisma.ancho):2:2);
  Writeln(' - El Area de la superficie formada por las caras del prisma rectangular introducido es: ', Area(Prisma.profundidad, Prisma.alto, Prisma.ancho):2:2);
  While (f<>1) do begin
    Writeln(' ---- Calculo finalizado, escriba "1" para terminar el Programa'); Readln(f);
  end;
end.

