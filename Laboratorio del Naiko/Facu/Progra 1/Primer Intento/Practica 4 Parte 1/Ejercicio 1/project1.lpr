program project1;
function Area(b:integer;h:integer):integer; // Formula de Base * Altura
begin
  Area:=b*h;
end;
function Volumen(B:integer;h:integer;P:integer):integer; // Formula Base * Altura * Profundidad
begin
  Volumen:=B*H*P;
end;

var
  A,L,P:integer; // Alto, Largo, Profundidad
  loop:integer;

begin
  Writeln('Por Favor Introduzca Altura en cm');
  read(A);
  Writeln('Por Favor Introduzca Largo en cm');
  read(L);
  Writeln('Por Favor Introduzca Profundidad en cm');
  read(P);
  Writeln('El Area De los Lados 1 y 2 son ',Area(A,L));
  Writeln('El Area De los Lados 3 y 4 son ',Area(A,P));
  Writeln('El Area De los Lados 5 y 6 son ',Area(P,L));
  Writeln('');
  writeln('    __________ ');
  Writeln('   /         /|');
  Writeln('  /  ld 5   / |');
  Writeln(' /_________/ld|');
  Writeln(' |         | 3|');
  Writeln(' |  ld 1   | /');
  Writeln(' |_________|/');
  Writeln('');
  Writeln('El Volumen de La Figura es de ',Volumen(A,L,P));
  read(loop);
end.

