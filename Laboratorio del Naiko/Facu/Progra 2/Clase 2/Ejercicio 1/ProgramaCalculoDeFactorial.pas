program CalculoDeFactorial;


{PROGRAMA PRINCIPAL}
var 
  num: integer;
Begin

  writeln( 'Ingrese un entero no negativo:');
  readln (num);

  writeln ( num, '! = ', factorial(num));
  readln;
End.

