{
    Ejercicio 2
    
        Se quiere procesar la información relacionada a las sesiones de Bizarrap. Es por esto que se
    leen  de  teclado  los  siguientes  datos:  Invitado  de  la  sesión,  cantidad  de  visitas,  fecha  de
    lanzamiento y duración de la sesión (En minutos y Segundos). La lectura se realiza hasta llegar 
    a la sesión con fecha “30/04/2001” la cual no debe procesarse. Las sesiones se leen sin ningún criterio de orden.
    
    a. Informar con qué artistas realizó las dos sesiones más recientes.
    b. Informar con qué artista realizó la primera sesión que lanzó.
    c. Informar la cantidad de visitas de la sesión más corta.

    Nota: Implementar un módulo que determine si una fecha es menor que otra, un módulo que determina si una
        duración es mayor que otra, y un módulo que determine si dos fechas son iguales
}

Program tp4addej2;

Type 
  cadena = string[50];

  subrDias = 1 .. 31;
  subrMes = 1 .. 12;
  subrAnio = 1998 .. 2023;
  subrMin = 0 .. 59;
  subrHora = 0 .. 23;

  tipoFecha = Record
    dia: subrDias;
    mes: subrMes;
    anio: subrAnio;
  End;

  tipoDura = Record
    min: subrMin;
    hora: subrHora;
  End;

  tipoDatos = Record
    Invitado: cadena;
    cantVis: integer;
    fecha: tipoFecha;
    dura: tipoDura;
  End;

Const 
  // SI NECESITO CAMBIAR LA FECHA DE FINALIZADO LO PUEDO HACER ACA DIRECTAMENTE
  fin: tipoFecha = (
                    dia: 30; mes: 4; anio: 2001;
                   );
  // ACA PUEDO CAMBIAR EL MENSAJE EN CASO DE ERROR
  errorArtista: cadena = 'ERROR - DATO NO CARGADO';
  // ACA PUEDO CAMBIAR EL VALOR EN EL QUE EL EJ C DEVUELVE ERROR
  errorCant = 0;
  // ------------------------------------- MODULOS DEBUG -------------------------------------
Procedure imprimirDato(act: tipoDatos);
Begin
  With act Do
    Begin
      writeln('Invitado: ', Invitado);
      writeln(' - Cantidad de visitas: ', cantVis);
      With dura Do
        writeln(' - Duracion de la sesion: ', hora, ':', min);
    End;
End;
// ------------------------------------- MODULOS -------------------------------------
Function sonIguales(a, b: tipoFecha): boolean;
Begin
  sonIguales := (a.dia = b.dia) And (a.mes = b.mes) And (a.anio = b.anio);
End;

Function a_EsMenorFechaQue_b(a, b: tipoFecha): boolean;
// DETERMINA SI UNA FECHA ES MENOR QUE OTRA

Var 
  aux: boolean;
Begin
  aux := false;
  If (a.anio < b.anio) Then aux := True
  Else If (a.anio = b.anio) And (a.mes < b.mes) Then aux := True
  Else If (a.anio = b.anio) And (a.mes = b.mes) And (a.dia < b.dia) Then aux := true;
  a_EsMenorFechaQue_b := aux;
End;

Function a_DuraMasQue_b(a, b: tipoDura): boolean;
// DETERMINA SI UNA DURACIÓN ES MAYOR QUE OTRA

Var 
  aux: boolean;
Begin
  aux := False;
  If (a.hora > b.hora) Then aux := True
  Else If (a.hora = b.hora) And (a.min > b.min) Then aux := True;
  a_DuraMasQue_b := aux;
End;

Procedure leerDato(Var act: tipoDatos);
Begin
  writeln(' --------- Introduzca la fecha de la sesión ---------');
  With fecha Do
    Begin
      writeln(' - Dia:');
      readln(dia);
      writeln(' - Mes:');
      readln(mes);
      writeln(' - Anio:');
      readln(anio);
    End;

  If (act.fecha<>fin) Then
    Begin
      With act Do
        Begin
          writeln('Introduzca al invitado:');
          readln(Invitado);
          writeln('Introduzca la cantidad de visitas:');
          readln(cantVis);
          writeln(' - Duracion de la sesion:');
          With dura Do
            Begin
              writeln(' - Minutos:');
              readln(min);
              writeln(' - Horas:');
              readln(hora);
            End;
        End;
    End;
End;
Procedure recorrerDatos(Var artistaEjA1, artistaEjA1, artistaEjB: cadena; Var cantVisEjC: Integer);
// --------- TERMINASTE TODOS LOS MODULOS Y LOS IMPRIMIR, FALTA IMPLEMENTAR TODAS LAS COMPARACIONES Y TESTEAR

Var 
  act, primerLanzada: tipoDatos;
  menorDura: tipoDura;
Begin
  // INICIALIZO
  primerLanzada.fecha := fin; // inicializo en la fecha fin, ya que es una fecha conocida que no debe estar en el reconteo, por lo tanto si aparece al final seguramente se encuentre sin cargar

  // MAIN
  leerDato(act);
  While (act.fecha<>fin) Do
    Begin
      artistaEjA1 := artistaEjB;
      artistaEjA1 := act.Invitado;



    End;
End;
// ------------------------------------- PROGRAMA PRINCIPAL -------------------------------------

Var 
  artistaEjA1, artistaEjA2, artistaEjB: cadena;
  cantVisEjC: Integer;

Begin
  // INICIALIZO
  artistaEjA1 := errorArtista;
  artistaEjA2 := errorArtista;
  artistaEjB := errorArtista;
  cantVisEjC := errorCant;

  // Prog Ppal
  recorrerDatos(artistaEjA1, artistaEjA2, artistaEjB, cantVisEjC);

  // IMPRIMO
  writeln('Artistas que se realizó las dos sesiones más recientes: ', artistaEjA1, ' y ', artistaEjA2, '.');
  writeln('Artista realizó la primera sesión lanzada: ', artistaEjB, '.');
  writeln('Cantidad de visitas de la sesión mas corta: ', cantVisEjC);

End.
