{

    ----------------------------------------------------------------------------
    tengo la siguiente estructura de pascal:

    tipoPlato = record
            nomP, temp si es frio o caliente, ingrePrinc: cadena;
        end;
        tipoParticipante = record
            nombre, apellido, sexo: cadena;
            pais: subcPaises;
            plato: tipoPlato;
            edad: integer;
        end;

    hazme un programa que asigne valores random a una variable de la siguiente forma:
    (nombre: '*nombre random de 50 caracteres o menos*'; apellido; '*apellido random de 50 caracteres o menos*';
    sexo:'* random entre masculino o femenino*';plato.nop: '*plato random*';
    plato.temp: '*random entre caliente o frio*'; edad:'*numero entero random*'), 
    el pais lo leere en otra parte, no lo tomes en cuenta

    ----------------------------------------------------------------------------
    Claro, puedo ayudarte a crear un programa en Pascal que asigne valores aleatorios a una variable 
    de tipo `tipoParticipante`. Aquí tienes un ejemplo de cómo hacerlo:

    Este programa utiliza arrays predefinidos de nombres, apellidos, platos, sexos y edades para asignar valores
    aleatorios a la variable `participanteAleatorio`. Puedes ajustar los valores en los arrays según 
    tus preferencias.
}
program GenerarParticipanteAleatorio;
uses crt;
type
    cadena = string[50];
    subcPaises = integer;  { Supongamos que subcPaises es un tipo válido en tu código }

    tipoPlato = record
        nomP, temp, ingrePrinc: cadena;
    end;

    tipoParticipante = record
        nombre, apellido, sexo: cadena;
        pais: subcPaises;
        plato: tipoPlato;
        edad: integer;
    end;

var
    participanteAleatorio: tipoParticipante;
    nombres: array[1..5] of cadena = ('Juan', 'Ana', 'Pedro', 'María', 'Luis');
    apellidos: array[1..5] of cadena = ('Gómez', 'Pérez', 'López', 'Rodríguez', 'Martínez');
    platos: array[1..5] of cadena = ('Sopa de Tomate', 'Parrillada', 'Ensalada César', 'Lasagna', 'Tacos');
    sexos: array[1..2] of cadena = ('Masculino', 'Femenino');
    edades: array[1..5] of integer = (25, 30, 35, 40, 45);

begin
    clrscr;
    { Genera valores aleatorios }
    participanteAleatorio.nombre := nombres[random(5) + 1];
    participanteAleatorio.apellido := apellidos[random(5) + 1];
    participanteAleatorio.sexo := sexos[random(2) + 1];
    participanteAleatorio.plato.nomP := platos[random(5) + 1];
    participanteAleatorio.plato.temp := sexos[random(2) + 1];
    participanteAleatorio.edad := edades[random(5) + 1];

    { Muestra los valores aleatorios }
    writeln('Nombre: ', participanteAleatorio.nombre);
    writeln('Apellido: ', participanteAleatorio.apellido);
    writeln('Sexo: ', participanteAleatorio.sexo);
    writeln('Plato: ', participanteAleatorio.plato.nomP);
    writeln('Temp: ', participanteAleatorio.plato.temp);
    writeln('Edad: ', participanteAleatorio.edad);
    
    readln;
end.
