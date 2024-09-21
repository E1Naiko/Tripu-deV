program Project7;
const
    FIN=0;
type
  paciente = record
    dni: integer;
    codpostal: integer;
    ciudad: string;
  end;

  arbol= ^nodo;
  nodo = record
    ciudad: string;
    codpostal: integer;
    total: integer;
    HD,HI: arbol;
  end;

procedure LeerPaciente(var p:paciente);
begin
     with p do begin
       writeln(' Dni: ');
       readln(dni);
       if (dni <> FIN) then begin
         writeln(' Codigo Postal:');
         readln(codpostal);
         writeln(' Ciudad: ');
       end;
     end;
end;

procedure AgregarNodo( var a:arbol; p:paciente);
begin
     if (a = nil) then begin
       new(a);
       a^.nodo.ciudad:= p.ciudad;
       a^.nodo.codpostal:= p.codpostal;
       a^.nodo.total:= 1;
       a^.HI:= nil;
       a^.HD:= nil;
     end else
         if (a^.nodo.codpostal > p.codpostal) then
            AgregarNodo(a^.HI,p)
            else if(a^.nodo.codpostal < p.codpostal) then
               AgregarNodo(a^.HD,p)
               else
                 a^.nodo.total:= a^.nodo.total + 1;
end;

procedure Crearbol(var a:arbol);
var
  p:paciente;
begin
     CargarPaciente(p);
     while (p.dni <> FIN) do begin
       AgregarNodo(a,p);
       CargarPaciente(p);
     end;
end;

begin
end.

