{
    Ejercicio 3
        La administración que realiza la 47 edición de la Feria del Libro desea conocer la información
    de los libros más vendidos. De cada libro se conoce: título, autor/a, ISBN, género, precio y
    fecha de publicación (día, mes y año).
    Implementar un programa que realice la lectura de los libros, dicha lectura finaliza con el libro
    titulado “De amor y de sombra” el cual debe procesarse.
    
    Se pide:
        a. Informar título, ISBN y autor de aquellos libros publicados entre el 15 de Marzo de
    2023 y el 15 de Julio de 2023.
        b. Informar el porcentaje de libros cuyo precio es menor a 3.000 pesos.
        c. Informar la cantidad de libros pertenecientes al género “Novela” y en donde la suma de los dígitos del año
    sea par
}
program tp4addej3;
type
    cadena = string[50];
    subrDia = 1..31; subrMes = 1..12;

    tipoFecha = record
        dia: subrDia;
        mes: subrMes;
        anio: integer; // normalmente usaria un subrango pero voy a usar un integer ya que tengo que sumar los digitos de años pares que cumplan ejC
    end;

    tipoLibro = record
        titulo, autor, ISBN, genero: cadena;
        precio: real;
        publi: tipoFecha;
    end;
// ---------------------------- MODULOS ----------------------------
// ---------------------------- PROGRAMA PRINCIPAL ----------------------------
var
    porcentaje:real;
begin
end.