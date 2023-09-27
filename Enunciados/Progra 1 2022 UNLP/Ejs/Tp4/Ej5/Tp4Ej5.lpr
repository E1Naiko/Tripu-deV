program Tp4Ej5;
type
  Dias = 1..31; Meses = 1..12;
  Fechas = record
    Dia:Dias;
    Mes:Meses;
    Anio:integer;
  end;
  Horas = record
    hor:integer;
    min:integer;
  end;
  Atencion = record
    Paciente:String[30];
    Medico:String[30];
    Fecha:Fechas;
    Llegada:Horas;
    Salida:Horas;
  end;

{Modulos}
  procedure Lector(var A:Atencion);
   begin
     Writeln(' - Introduzca el mes a procesar'); readln(A.Fecha.Mes);
     Writeln(' - Introduzca el dia a procesar'); readln(A.Fecha.Dia);
     Writeln(' - Introduzca el nombre del paciente'); readln(A.Paciente);
     Writeln(' - Introduzca el nombre del medico que lo atendio'); readln(A.Medico);
     Writeln(' - Introduzca el tiempo de llegada del paciente');
     Writeln(' - Hora:'); readln(A.Llegada.hor);
     Writeln(' - Minutos:'); readln(A.Llegada.min);
     Writeln(' - Introduzca el tiempo de salida del paciente');
     Writeln(' - Hora:');readln(A.Salida.hor);
     Writeln(' - Minutos:'); readln(A.Salida.min);
   end;

{Programa}
var
  Actual, No_Tan_Paciente: Atencion;
  Agosto, minuts, Max: integer;

begin
  // Inicio
  Agosto:=0; minuts:=0; Max:=0;
  Actual.Paciente:='-'; Actual.Medico:='-'; Actual.Fecha.Anio:=0; Actual.Fecha.Mes:=1;
  Actual.Llegada.hor:=0; Actual.Llegada.min:=0;
  Actual.Salida.hor:=0; Actual.Salida.min:=0;

  // Programa
  Writeln(' --- Introduzca el año a procesar ---'); Readln(Actual.Fecha.Anio);
  While Actual.Fecha.Anio<>0 do begin
    Lector(Actual);
    if Actual.Fecha.Mes=8 then Agosto:=Agosto+1;
    minuts:= ((Actual.Salida.hor*60)+Actual.Salida.min)-((Actual.Llegada.hor*60)+Actual.Llegada.min);
    if Max<minuts then begin
      No_Tan_Paciente:=Actual;
      Max:=minuts;
    end;
    Writeln(' --- Introduzca el año a procesar, o introduzca 0 para mostrar los resultados ---'); Readln(Actual.Fecha.Anio);
  end;
  Writeln('');

  // Final
  if Actual.paciente<>'-' then begin
    Writeln(' - Nombre del paciente con mas tiempo de espera: ', No_Tan_Paciente.Paciente);
    Writeln(' - Pacientes atendidos en el mes de agosto: ', Agosto);
  end else Writeln(' - Error: no se introdujeron pacientes');
  Writeln(' ------------------ Precione enter para cerrar el programa ------------------'); Readln();
end.

