program Tp3PtEj4;
type
  Letras=set of char;
var
   conj:char;   //Conjunto
   Abc:letras;
   cop:letras;    //Copiador (para la logica)

   loop:integer;//loop
begin
     Abc:=['a'..'z'];
     read(conj);
     cop:=conj;
     Abc:=Abc-cop;

     writeln(Abc, ' ', cop);
end.

