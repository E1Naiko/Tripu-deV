program Tp4Ej7;
type
  Aux = String[30];
  Temp = 'C','F';
  Gen = 'M','H','N';
  Plato = record
    Temperatura:Temp;
    Principal:Aux;
  end;
  Participantes = record
    Nombre:Aux;
    Apellido:Aux;
    Pais:Aux;
    Sexo:Gen;
    Edad:integer;
    Platos:Plato;
  end;

var
  Fem, Fem_Cont:integer; EdadPromedio:real;
begin

end.

