program prueba;

const
    ValorA = 9999;  // Valor "infinito" para cortar el algoritmo

type
    // Registro del archivo maestro (info completa del restaurante)
    cadenaResto = Record
        codigo: integer;
        nombre: String;
        costo: Real;
        fecha: LongInt;
        cant_ven: integer; // cantidad total vendida (se actualiza)
    end;

    // Registro de los archivos detalle (ventas)
    restoReg = Record
        codigo: integer;
        cant_ven: integer; // ventas a sumar
    end;

    // Archivos
    maestro = file of cadenaResto;
    fdetalle = file of restoReg;

    // Estructuras auxiliares
    resto = array [1..17] of restoReg;   // guarda el "registro actual" de cada detalle
    detalle = array [1..17] of fdetalle; // los 17 archivos detalle

// ------------------------ Modulos ------------------------

procedure Leer(var det: fdetalle; var regDet: RestoReg);
begin
    if (not eof(det)) then
        read(det, regDet)   // lee un registro del archivo
    else
        regDet.codigo := ValorA; // si terminó, pone un código "infinito"
end;

procedure minimo(var det: detalle; var res: resto; var min: restoReg);
var
    posMin, i: integer;
begin
    min := res[1];   // asumimos que el primero es el menor
    posMin := 1;

    // buscamos el menor código entre los 17 detalles
    for i := 2 to 17 do begin
        if (res[i].codigo < min.codigo) then begin
            min := res[i];
            posMin := i;
        end;
    end;

    // avanzamos en el archivo que tenía el mínimo
    Leer(det[posMin], res[posMin]);
end;

procedure Actualizar(var M: maestro; var det: detalle);
var
    i: integer;
    res: resto;          // vector con registros actuales de cada detalle
    min: restoReg;       // mínimo actual
    regM: cadenaResto;   // registro del maestro

begin
    for i := 1 to 17 do begin
        reset(det[i]);           // abre cada detalle
        Leer(det[i], res[i]);    // lee el primer registro de cada uno
    end;

    reset(M);                    // abre el maestro
    minimo(det, res, min);       // obtiene el primer mínimo

    read(M, regM);  // leer primero

    while (min.codigo <> ValorA) do begin
        while (regM.codigo <> min.codigo) do
            read(M, regM);

        while (regM.codigo = min.codigo) do begin
            regM.cant_ven := regM.cant_ven + min.cant_ven;
            minimo(det, res, min);
        end;

        seek(M, filepos(M) - 1);
        write(M, regM);

        if not eof(M) then
            read(M, regM);
    end;

    close(M);
    for i := 1 to 17 do
        close(det[i]);
end;
    
// ------------------------ PROGRAMA PRINCIPAL ------------------------
var
    M: maestro;
    det: detalle;
    nombreDet: String;
    i: integer;

begin
    // pide nombres de los 17 archivos detalle
    for i := 1 to 17 do begin
        writeln('ESCRIBA UN NOMBRE PARA EL ARCHIVO: ');
        read(nombreDet);
        assign(det[i], nombreDet);
    end;

    assign(M, 'maestro'); // archivo maestro

    Actualizar(M, det);   // ejecuta todo el proceso
end.
