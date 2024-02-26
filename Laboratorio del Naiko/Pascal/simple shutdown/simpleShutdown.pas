program SimpleShutdown;

uses
  Dos, SysUtils;

var
  h, m, s: Integer;
  ok: Boolean;
  imp: String[2];
  sol: String;

begin
  m := 0;
  h := 0;
  s := 0;

  Writeln('Ejecutar comando Shutdown?');
  repeat
    begin
      Writeln('Introduzca horas:');
      Readln(h);

      Writeln('Introduzca minutos:');
      Readln(m);
      
      Writeln('Introduzca segundos:');
      Readln(s);

      Writeln(' - ', h, ':', m, ':', s);
      Writeln('Si?');
      Readln(imp);
      ok := 'SI' = UpperCase(imp);
    end;
  until ok;

  Writeln('SEGURO?');
  Writeln('Si?');
  Readln(imp);
  ok := 'SI' = UpperCase(imp);

  if ok then
  begin
    sol := '/s /t ' + IntToStr((h * 60 * 60) + (m * 60) + s);
    Exec('shutdown.exe', sol);
    Writeln('Apagando el sistema en ', h, ' horas ', m, ' minutos.');
  end;

  Readln;
end.


      Writeln(' - ', h, ' horas ', m, ' minutos.');
      Writeln('Si?');
      Readln(imp);
      imp:= UpperCase(imp);
      if imp = 'SI' then ok:=true
					else if (imp = 'HLT') then halt;
    end;
  until ok;

  Writeln('SEGURO?');
  Writeln('Si?');
  Readln(imp);
  if imp = 'SI' then ok:=true
				else if (imp = 'HLT') then halt;

  if ok then
  begin
    sol := '/s /t ' + IntToStr((h * 60 * 60) + (m * 60));
    Exec('shutdown.exe', sol);
    Writeln('Apagando el sistema en ', h, ' horas ', m, ' minutos.');
  end;

  Readln;
end.
