program Ejercicio_4_Intento_3_FUNCAAAAAAA;
var
  Paises, Especies, Paises_30: integer;
  P_Max_Ma, P_Max_Me, E_Max_Ma, E_Max_Me: integer;
  P_Min_Ma, P_Min_Me, E_Min_Ma, E_Min_Me: integer;
  Promedio: integer;

begin
  P_Max_Ma:= 0; P_Max_Me:= 0; E_Max_Ma:= 0; E_Max_me:= 0;
  P_Min_Ma:= 999; P_Min_Me:= 999; E_Min_Me:= 999; E_Min_me:= 999;
  Promedio:= 0; Paises_30:= 0;

  For Paises:=1 to 10 do begin
    read(Especies);
    if (Especies>E_Max_Ma) then begin
      E_Max_Me:=E_Max_Ma;
      P_Max_Me:=P_Max_Ma;
      E_Max_Ma:=Especies;
      P_Max_Ma:=Paises;
    end
    else
        if (Especies>E_Max_Me) then begin
          E_Max_Me:=Especies;
          P_Max_Me:=Paises;
        end;
    if (Especies<E_Min_Me) then begin
      E_Min_Ma:=E_Min_Me;
      P_Min_Ma:=P_Min_Me;
      E_Min_Me:=Especies;
      P_Min_Me:=Paises;
    end
    else
        if (Especies<E_Min_Ma) then begin
          E_Min_Ma:=Especies;
          P_Min_Ma:=Paises;
        end;
    if (Especies>=30) then begin
      Paises_30:=Paises_30+1
    end;
    Promedio:= Paises_30*10

  end;

  Writeln('Los 2 Paises Con Mayor Cantidad De Especies Animales son');
  Writeln('El Pais numero ', P_Max_Ma, ' con ', E_Max_Ma,' Especies Animales');
  Writeln('y el Pais numero ', P_Max_Me, ' con ', E_Max_Me, ' Epecies Animales');
  Writeln('y Los 2 Paises Con Menor Cantidad De Especies Animales son');
  Writeln('El Pais numero ', P_Min_Me, ' con ', E_Min_Me,' Especies Animales');
  Writeln('y el Pais numero ', P_Min_Ma, ' con ', E_Min_Ma, ' Epecies Animales');
  Writeln('El Promedio de Paises Con Mas de 30 Especies Animales es del ', Promedio, '%');
  read(Especies);
end.

