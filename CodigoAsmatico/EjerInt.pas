PROGRAM EjercicioIntegrador;
CONST
	fin='zzz';
        codMax=5;
        maxMat=38;
        maxLegajo=6;
        maxNombre=10;
        maxApell=15;
        maxNomMat=15;
TYPE
        codigo=array [1..codMax] of char;

        legajinhio=array [1..maxLegajo] of integer;

        nombreAlumno=RECORD
           nombre:nom;
           apellido:ape;
        END;

        materia=RECORD
           nota:integer;
           cod_mat:codigo;
        END;

        materiass=array [1..maxMat] of materia;

        name=RECORD
           nombre:string[maxNombre];
           apellido:string[maxApell];
        END;

        lista:^alumno;
        alumno=RECORD
           nombreCompleto:nombreAlumno;
           legajo:legajinhio;
           mat_ap:materiass;
        END;

        registroMaterias=RECORD
           nombreMateria:string[maxNomMat];
           codigoMateria:codigo;
        end;

        estructuraMaterias=array [1..maxMat] of registroMaterias;

FUNCTION NombreDeLaMateria (materias:estructuraMaterias; codigoABuscar:codigo):string;
VAR
    i:integer; encontrado:boolean; nombreMateria:string[maxNomMat];
BEGIN
    encontrado:=false;
    i:=0;
    while (i < maxMat) OR (encontrado=false) do begin
       i:=i+1;
       if (materias[i].codigoMateria=codigoABuscar) then begin
         encontrado:=true;
         nombre_materia:=materias[i].nombreMateria;
       end;
    end;
    if encontrado=false then NombreDeLaMateria:='';
    else NombreDeLaMateria:=nombre_materia;
END;

FUNCTION Existir_O_No (materias:estructuraMaterias; codigoABuscar:codigo): boolean;
BEGIN
    if (NombreDeLaMateria(materias,codigoABuscar)<>'') then begin
      Existir_O_No:=false;
    else Existir_O_No:=true;
END;

PROCEDURE Ordenamiento ();

END;
     
