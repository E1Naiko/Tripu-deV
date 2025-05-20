program project1;
  var
    Libros, Paginas, Libros_Me_1, Libros_Me_1_P, Libros_Me_2, Libros_Me_2_P, Libros_Ma, Libros_Ma_P: integer;
begin
  Libros_Me_1:= 99999; Libros_Me_2:=99999; Libros_Me_1_P:=0; Libros_Me_2_P:=0; Libros_Ma:=0; Libros_Ma_P:=0;
  For Libros:=1 to 1000 do begin
    read(Paginas);
    If (Paginas>Libros_Ma_P) then begin
       Libros_Ma:=Libros;
       Libros_Ma_P:=Paginas;
    end;
    If (Paginas<Libros_Me_1_P) then begin
       Libros_Me_1:=Libros_Me_2;
       Libros_Me_1_P:=Libros_Me_2_P;
       Libros_Me_1:=Libros;
       Libros_Me_1_P:=Paginas;
    end
    else
        If (Paginas<Libros_Me_2) then begin
           Libros_Me_2:=Libros;
           Libros_Me_2_P:=Paginas;
        end;
  end;
  Writeln('Los Libros con Menor Cantidad de Páginas son, Libro Número ', Libros_Me_1, ' Con ', Libros_Me_1_P, ' Páginas');
  Writeln('Y el Libro Número ', Libros_Me_2, ' Con ', Libros_Me_2_P , ' Páginas');
  Writeln('Mientras que el Libro con Mayor Candtidad de Páginas es el Libro Numero ', Libro_Ma, ' Con ', Libros_Ma_P, ' Páginas');
  read(Libros);
end.

