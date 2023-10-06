{  Ejercicio 1
Se desea procesar la información de todos los radares de velocidad que posee la ciudad de 
La Plata en un día. Para ello se lee de cada radar: código de radar, velocidad máxima permitida 
y cantidad de vehículos registrados, y para de cada vehículo de cada radar, se lee patente y 
velocidad. La lectura finaliza cuando se lee el código de radar -1 que no debe procesarse. Se 
pide: 
a. Calcular e informar la velocidad promedio de los automóviles para cada radar.
b. Calcular e informar la cantidad de vehículos que fueron multados para cada radar.
c. Calcular e informar la patente del vehículo con mayor velocidad y la patente del vehículo con menor 
velocidad. 
Nota: Modularizar la solución.}
program TP4Add1Ej1_Eze;
uses crt;
const
	Fin = '-1';
type
	str30 = string[30];
	
	Datos_Veiculo_Registrado = record
		Patente: str30; 
		Velocidad: integer;		
	end;
	
	Datos_Radar = record
		Codigo_Radar: str30; 
		Vel_Max_Permitida: integer; 
		Cant_Veiculos_Registrados: integer; 
	end;
	
procedure Imprimir_Radar(Radar: Datos_Radar);
	begin
		writeln(Codigo_Radar);
		writeln(Vel_Max_Permitida);
		writeln(Cant_Veiculos_Registrados);
	end;

procedure Leer_Datos_Radar(Radar: Datos_Radar);
	begin
		with Radar do begin
			writeln('Codigo de radar: '); readln(Codigo_Radar);
			if (Codigo_Radar <> Fin) then begin
				write('Velocidad maxima perimitida: '); readln(Vel_Max_Permitida);
				write('Cantidad de veiculos registrados: '); readln(Cant_Veiculos_Registrados);
			end;
		end;
	end;

procedure Leer_Datos_Veiculo_Registrado();
begin
end;

//----------------------------PROGRAMA PRICIPAL----------------------------
var  
	Radar: Datos_Radar; 
	Veiculo_Registrado: Datos_Veiculo_Registrado;
	actual, i: integer;
BEGIN
	
	Leer_Datos_Radar(Radar);
	
	while (Radar.Codigo_Radar <> Fin) do begin //Mientras no sea -1 (Fin) seguira adelante.
		actual:= Radar.Cant_Veiculos_Registrados; //Guardara la cantidad de veiculos en ese radar en actual.
		
		for i:= 1 to Radar.Cant_Veiculos_Registrados do begin //Repetira la cantidad de veiculos registrados en ese radar. 
			writeln('Veiculo ', i);
			Leer_Datos_Veiculo_Registrado(Veiculo_Registrado);
		end;
		
		Leer_Datos_Radar(Radar);
	end, 
	
	
END.
