program Tp4Pt1Ej5;
type
    Entrada = Record
            Apell: String;    // Apellido
            Nomb: String;     // Nombre
            Dia: 1..31;       // Dia de Ingreso
            Mes: 1..12;       // Mes de Ingreso
            Tiemp: integer;   // Tiempo de espera
            end;

    {Funcion Para el lector}

Procedure LeerEnt(var Paciente:Entrada);
          begin
               Writeln('Por Favor Escriba el Nombre del Paciente');
               Readln(Paciente.Nomb);
               Writeln('Por Favor Escriba el Dia de Entrada del Paciente');
               Readln(Paciente.Dia);
               Writeln('Por Favor Escriba el Mes de Entrada del Paciente');
               Readln(Paciente.Mes);
               Writeln('Por Favor Escriba el Tiempo de Espera del Paciente en Horas');
               Readln(Paciente.Tiemp);

          end;

          {Programa Principal}
var
   Paciente,MasPaciente:Entrada;
   Ag:integer; // Contador Para los Pacientes que entraron en agosto
   loop:integer;
begin
     ag:=0;
     MasPaciente.Tiemp:=0;
     Writeln('Por Favor Escriba el Apellido del Paciente');
     Readln(Paciente.Apell);
     while (Paciente.Apell<>'Fin') or (Paciente.Apell<>'fin') do
           begin
             LeerEnt(Paciente);
             if Paciente.Tiemp > MasPaciente.Tiemp then MasPaciente:=Paciente;
             if Paciente.Mes=8 then ag:=ag+1;
             Writeln('Por Favor Escriba el Apellido del Paciente');
             Readln(Paciente.Apell);
           end;
     Writeln('El Paciente Que Esperó Mas Tiempo fue ', MasPaciente.Apell, ' ', MasPaciente.Nomb,' Con ', MasPaciente.Tiemp,' Horas de Espera');

     {El Agostizador}
     if ag>1 then Writeln('Entraron ',ag ,' Pacientes en Agosto')
        else if ag=1 then Writeln('Entró 1 Paciente en Agosto')
             else Writeln('No Entraron Pacientes en Agosto');

     Writeln('Finalizando Programa');
     read(loop);
end.
