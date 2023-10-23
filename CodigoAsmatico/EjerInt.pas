PROGRAM EjercicioIntegrador;

CONST
	fin='zzz';
        maxMat=38;
        maxLegajo=6;
        maxNombre=10;
	
TYPE

        lega=array [1..maxLegajo] of integer;

        materia=RECORD
           nota=6..10;
           cod_mat:string[6];
        END;

        materias=array [1..maxMat] of materia;

        name=RECORD
           nombre:string[maxNombre];
           apellido:string[maxNombre];
        END;

        lista:^alumno;
        alumno=RECORD
           nombre:name;
           legajo:lega;
           aprobadas:materiass;
        END;

        TMateria=RECORD
           nombre:string[50];
           codigo:string[6];
        end;

        TMaterias=array [1..maxMat] of TMateria;

CONST

MATERIAS: TMaterias = ( (codigo: 'E0228'; nombre: 'Práctica Profesional Supervisada'), 
(codigo: 'E0282'; nombre: 'Electrotecnia y Electrónica'), 
(codigo: 'E0301'; nombre: 'Introducción al Diseño Lógico'), 
(codigo: 'E0302'; nombre: 'Introducción al Procesamiento de Señales'), 
(codigo: 'E0303'; nombre: 'Redes de Datos 1'), 
(codigo: 'E0304'; nombre: 'Instrumentación y Control'), 
(codigo: 'E0305'; nombre: 'Circuitos Digitales y Microcontroladores'), 
(codigo: 'E0306'; nombre: 'Taller de Proyecto I'), 
(codigo: 'F0301'; nombre: 'Matemáticas A'), 
(codigo: 'F0302'; nombre: 'Matemáticas B'), 
(codigo: 'F0304'; nombre: 'Matemática C'), 
(codigo: 'F0307'; nombre: 'Estadistica'), 
(codigo: 'F0310'; nombre: 'Matemáticas D1'), 
(codigo: 'F0312'; nombre: 'Probabilidades'), 
(codigo: 'F0316'; nombre: 'Física I'), 
(codigo: 'F0317'; nombre: 'Física II'), 
(codigo: 'I101'; nombre: 'Programación I'), 
(codigo: 'I102'; nombre: 'Programación II'), 
(codigo: 'I103'; nombre: 'Programación III'), 
(codigo: 'I104'; nombre: 'Taller de Lenguajes I'), 
(codigo: 'I105'; nombre: 'Conceptos de Arquitectura de Computadoras'), 
(codigo: 'I106'; nombre: 'Conceptos de Sistemas Operativos'), 
(codigo: 'I107'; nombre: 'Taller de Lenguajes II'), 
(codigo: 'I108'; nombre: 'Conceptos de Bases de Datos'), 
(codigo: 'I109'; nombre: 'Taller de Arquitectura'), 
(codigo: 'I110'; nombre: 'Ingeniería de Software'), 
(codigo: 'I111'; nombre: 'Concurrencia y Paralelismo'), 
(codigo: 'I112'; nombre: 'Bases de Datos'), 
(codigo: 'I113'; nombre: 'Economía y Emprendedorismo'), 
(codigo: 'I114'; nombre: 'Redes de Datos II'), 
(codigo: 'I115'; nombre: 'Sistemas de Tiempo Real'), 
(codigo: 'I116'; nombre: 'Sistemas Distribuidos y Paralelos'), 
(codigo: 'I117'; nombre: 'Aspectos Legales de Ingeniería Informática'), 
(codigo: 'I118'; nombre: 'Taller de Proyecto II'), 
(codigo: 'INFIN'; nombre: 'Inglés (Prueba de Suficiencia)'), 
(codigo: 'M0670'; nombre: 'Sistemas de Representación'), 
(codigo: 'S0012'; nombre: 'Seminario de Redacción de Textos Profesionales'), 
(codigo: 'U0902'; nombre: 'Química')
);

PROCEDURE Busqueda (Materias:TMaterias; buscado:string[5], VAR nombreMateria:string[50]);
VAR
    i:integer; encontrado:boolean;
BEGIN
    encontrado:=false;
    i:=0;
    while (i < maxMat) OR (encontrado) do begin
       i:=i+1;
       if (Materias[i].codigo=buscado) then begin
         encontrado:=true;
         nombreMateria:=materias[i].nombre;
       end;
    end;
    if encontrado=false then nombreMateria:='';
END;

FUNCTION Existencia (Materias:TMaterias; buscado:string[5]): boolean;
BEGIN
    Busqueda(mat,busq,nombreMateria);
    if (nombreMateria<>'') then
      Existencia:=false;
    else Existencia:=true;
END;

PROCEDURE Ordenamiento ();

END;
     
