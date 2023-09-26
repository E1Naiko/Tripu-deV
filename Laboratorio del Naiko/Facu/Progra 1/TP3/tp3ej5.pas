{
    5. * a) Implemente un módulo que permita imprimir los últimos dígitos de un número en orden inverso. 

El módulo debe recibir el número y la cantidad de dígitos a imprimir.

* b) Escriba un programa que lea números enteros por teclado hasta que llegue el número 0. Utilice 
el módulo implementado en a) para imprimir los últimos 3 y 5 dígitos de cada número ingresado.
}
program tp3ej5;
uses crt;
const
  ult1= 3; ult2= 5; fin= 0;
function ultimosXdigitosInversos(n, cant: integer): integer;
var i, dig: integer;
begin
  dig:=0;
  for i:=1 to cant do begin
    dig:= dig*10;
    dig:= dig + (n mod 10);
    n:= n div 10;
  end;
  ultimosXdigitosInversos:= dig;
end;
var
  n: integer;
begin
  WriteLn(' Introduzca un n: '); read(n);
  while (n<>fin) do begin
    writeln(ultimosXdigitosInversos(n,ult1));
    WriteLn(ultimosXdigitosInversos(n,ult2));
    WriteLn(' Introduzca un n o ', fin, ' para terminar : '); read(n);
    
  end;
  readln;
end.

