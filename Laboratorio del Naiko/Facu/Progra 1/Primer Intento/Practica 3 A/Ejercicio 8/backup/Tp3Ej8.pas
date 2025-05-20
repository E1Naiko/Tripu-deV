program Tp3Ej8;
type
   Carc=string;// Caracteres
procedure CuentaPapas(Ca:carc);
const
  fin='.';
var
  cont:integer;//contador
begin
     cont:=0;
     read(ca);
     while (Ca<>fin) do begin
           if (ca='p') then begin
             read(Ca);
             if (ca='a') then cont:=cont+1;
           end;
           read(Ca);
     end;
     if Cont>0 then writeln('La cantidad de Caracteres p seguidos por a es ',cont);
end;
var
  SetCarc:Carc; //Set de Caracteres numero
  loop:integer; //loop
begin
     read(SetCarc);
     CuentaPapas(SetCarc);
     read(loop);
end.

