program clase4_ejercicio;
const
  FIN= 'ZZZ';
type
  cadena= String[50];
  alumno= record
    dni: longint;
    nombre: cadena;
    apellido: cadena;
  end;

  {Estructura para el árbol}
  arbol= ^nodoArbol;
  nodoArbol= record
    dato: alumno;
    hi,hd: arbol;
  end;

procedure LeerAlumno(var a:alumno);
begin
  with(a)do
  begin
    writeln('Ingrese el nombre del alumno: ');
    readln(nombre);
    if(nombre <> FIN)then
    begin
      writeln('Ingrese el apellido del alumno: ');
      readln(apellido);
      writeln('Ingrese el DNI del alumno: ');
      readln(dni);
    end;
  end;
end;

procedure Agregar(var arb: arbol; alu:alumno);
begin
  if(arb = nil)then
  begin
    {Crear el nodo y enlazarlo}
    new(arb);
    arb^.dato := alu;
    arb^.hi:= nil;
    arb^.hd:= nil;
  end
  else{no tenemos el árbol vacío}
    if(alu.dni < arb^.dato.dni)then
      Agregar(arb^.hi, alu)
    else
      Agregar(arb^.hd, alu);
end;

procedure CargarEstructura(var a:arbol);
var
  alu: alumno;
begin
  LeerAlumno(alu);
  while(alu.nombre <> FIN)do
  begin
    Agregar(a, alu);
    LeerAlumno(alu);
  end;
end;

procedure ImprimirDato(a: alumno);
begin
  writeln('Alumno: ', a.nombre, ' ', a.apellido, ' DNI: ', a.dni);
end;

procedure Imprimir(arb:arbol);
begin
  if(arb <> nil)then
  begin
    Imprimir(arb^.hi); //1
    ImprimirDato(arb^.dato); //2
    Imprimir(arb^.hd); //3
  end;
end;

procedure BusquedaDNI(a: arbol; dni: longint; var alu: alumno);
begin
  if(a <> nil)then
  begin
    if(a^.dato.dni = dni)then
       alu:= a^.dato {Copiar el dato del árbol al registro de retorno}
    else
       if(a^.dato.dni > dni)then
          BusquedaDNI(a^.hi, dni, alu)
       else
          BusquedaDNI(a^.hd, dni, alu);
  end
  else
  begin
    alu.dni:= -1;{no lo encontré}
  end;
end;

var
  arbolCurso: arbol;
  dni: longint;
  alumnoCurso: alumno;
begin
  {Inicialización y carga}
  arbolCurso:= nil;
  CargarEstructura(arbolCurso);
  {Impresión de datos}
  Imprimir(arbolCurso);
  {Recorridos}
  writeln('Ingrese un DNI');
  readln(dni);
  BusquedaDNI(arbolCurso, dni, alumnoCurso);
  if(alumnoCurso.dni <> -1)then begin
     writeln('El alumno buscado es: ');
     ImprimirDato(alumnoCurso);
  end
  else
    writeln('El alumno buscado no existe en este curso');
  readln;
end.

