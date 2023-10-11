{	TP6ADDEJ2
	2. Ejercicio: Juego de la Oca
}
{	CONSIGNA

	El juego de la Oca es un juego de mesa clásico que implica tirar dados
	y mover fichas por un tablero con casillas especiales.
	
	En este ejercicio, se te pide implementar una versión simplificada del juego
	de la Oca para 2 jugadores. El juego se desarrolla en un tablero lineal
	de 63 casillas, cada una de las cuales puede tener uno de los
	siguientes tipos: "libre", "impulso", "retroceso" o "trampa". Un
	casillero “libre” no produce ninguna acción; “impulso” indica un
	número que el jugador debe avanzar a partir del casillero actual;
	“retroceso” indica un número el jugador debe retroceder a partir del casillero actual; mientras que “trampa” indica
	“perder el turno”. Una "prenda" solo se aplica si el jugador llega a ella mediante un tiro de dado, no a través de
	casillas de "impulso" o "retroceso".
}
	
{	Mecánica del Juego:
	
	1. El tablero se debe inicializar de manera dinámica antes de cada partida, asignando a cada casilla su tipo y
		prenda correspondiente. Implementa una estrategia para asignar a cada casillero su “prenda”. Por
		ejemplo, los casilleros impares pueden ser de retroceso, los pares de avance, los casilleros múltiplos de 5
		pueden ser de tipo "perder turno", etc.

	2. Al comenzar el juego, el programa debe solicitar el nombre de los dos jugadores.

	3. En cada turno, el programa debe imprimir en pantalla el nombre del jugador cuyo turno es, el valor del
		dado arrojado y la prenda del casillero en el que se encuentra (si la hay).

	4. El juego continúa hasta que uno de los jugadores llega a la casilla 63, "el jardín de la oca". Si un jugador cae
		en un casillero con un valor mayor a 63, debe pasar su turno sin avanzar.

	5. El juego finaliza cuando un jugador llega al "jardín de la oca", y el programa debe anunciar al ganador.

}
{	Módulo tirarDado():
		Implementa un módulo llamado tirarDado() que devuelva aleatoriamente un número del 1 al 6. Este módulo se
		utilizará para determinar el avance de los jugadores en cada turno.
	
}
{	Consideraciones para futuras variaciones:
		Diseña tu implementación de manera que permita futuras expansiones, como incrementar o decrementar la
		cantidad de casilleros, aceptar más de 2 jugadores y determinar quién comienza mediante una tirada de dado
		inicial.
}	
{	Requisitos:
	1. Asegúrate de que el juego siga las reglas y mecánicas descritas anteriormente.
	2. Comenta tu código de manera clara para explicar cómo funciona y cómo podrían realizarse futuras
		expansiones.
}

program tp6ADDej2;
uses crt;
const
	DIMF = 63;
	TOTALJUGADORES = 2;
type
	// tipos de datos para representar dados
	subrDado = 1..6;
	
	// tipos de datos para asignar el tablero
	casilla = string[16];
	subrIndice = 0 .. DIMF;
	arrTablero = array [1..DIMF] of casilla;
	
	// tipos de datos para almacenar jugadores
	cadenaNom = string[50];
	tipoJugador = record
		nom: cadenaNom;
		pos: subrIndice;
	end;
	arrJugador = array [1..TOTALJUGADORES] of tipoJugador;
	
// ------------------------------ MODULOS ------------------------------
function obtenerPrenda(): string; // SALIDO DE GPT, ES RE ILEGAL, DEVUELVE UNA PRENDA ALEATORIA
	const arrPrendas: array [1..5] of string = (
			'Realiza 20 sentadillas ahora mismo.',
			'Realiza una flexión de brazos con una sola mano.',
			'Recoge 5 objetos del mismo color en menos de 60 segundos.',
			'Usa una bufanda como cinturón durante todo el día.',
			'Viste una camiseta del revés por al menos una hora.'
		);
	begin
		randomize;
		// Utiliza la función Random para obtener un índice aleatorio en el rango de arrPrendas
		// y devuelve la prenda o desafío correspondiente
		obtenerPrenda := arrPrendas[Random(5) + 1];
	end;
	
procedure imprimirTablero(v: arrTablero);
	var
		i: subrIndice;
	begin
		writeln('TABLERO');
		for i:=1 to DIMF do begin
			write('[', v[i], '] ');
		end;
	end;

procedure inicializarTablero (var t: arrTablero);
	{METODO:
	  * casillas multiplo de 5 son trampa
	  * casillas pares son avance
	  * casillas multiplos de 3 impares son retroceso
	  * la 1era y las que no cumplan el resto son libres
	  * el casillero DIMF siempre es el "jardin de la oca"
	}
	var
		i: subrIndice;
	begin
		t[1]:= 'Libre';
		for i:=2 to DIMF do begin
			if( i mod 5 = 0) then begin
				t[i]:= 'Trampa'
			end
			else
				if ( i mod 2 = 0) then begin
					t[i]:= 'Avance';
				end
			else
				if (i mod 3 = 0) then begin
					t[i]:= 'Retroceso';
				end
			else t[i]:= 'Libre';
		end;
		t[DIMF]:= 'Jardin de la Oca';
end;

function tirarDado(): subrDado;
	begin
		randomize;
		tirarDado:= random(6)+1;
	end;

procedure recorrerTurno(var jug: tipoJugador; tab: arrTablero; var gano: boolean);
	var
		dado: subrDado;
	begin
		dado:= tirarDado;
		if ((jug.pos + dado) <= DIMF) then begin
			jug.pos:= jug.pos + dado;
			writeln('POSICION DEL JUGADOR: ', jug.pos);
			case tab[jug.pos] of
				'Libre': writeln('JUGADOR ', jug.nom ,' EN CASILLERO LIBRE.');
				'Trampa': begin
						writeln('JUGADOR ', jug.nom ,' EN CASILLERO TRAMPA, su prenda sera:');
						writeln(obtenerPrenda);
					end;
				'Avance': begin
						writeln('JUGADOR ', jug.nom ,' EN CASILLERO AVANCE, avanza un casillero.');
						jug.pos:= jug.pos + 1;
						if (jug.pos = DIMF) then begin
							writeln('JUGADOR ', jug.nom ,' LLEGO AL JARDIN DE LA OCA.');
							gano:= true;
						end;
					end;
				'Retroceso': begin
						writeln('JUGADOR ', jug.nom ,' EN CASILLERO RETROCESO, retrocede un casillero.');
						jug.pos:= jug.pos - 1;
					end;
				'Jardin de la Oca': begin
						writeln('JUGADOR ', jug.nom ,' LLEGO AL JARDIN DE LA OCA.');
						gano:= true;
					end;
				end;
			end
		else
			writeln('JUGADOR ', jug.nom ,' SE PASO DEL CASILLERO ', DIMF, ' SE QUEDA DONDE ESTABA.');
	end;

procedure inicializarJugadores(var j: arrJugador);
	var
		i: subrIndice;
	begin
		for i:=1 to TOTALJUGADORES do begin
			writeln('Introduzca el nombre del jugador ', i,' de ', TOTALJUGADORES, '.');
			readln(j[i].nom);
			j[i].pos:= 0;
		end;
	end;
// ------------------------------ PROGRAMA PRINCIPAL ------------------------------
var
	tablero: arrTablero;
	jugadores: arrJugador;
	gano: boolean;
	jugadorACT: integer;
BEGIN
	// INICIALIZO
	clrscr;
	gano:= false;
	jugadorACT:= 1;
	inicializarTablero(tablero);
	
	writeln;
	inicializarJugadores(jugadores);
	
	// MAIN
	imprimirTablero(tablero); writeln;
	while not(gano) do begin
		writeln;
		recorrerTurno(jugadores[jugadorACT], tablero, gano);
		if not(gano) then begin
			writeln('precione cualquier boton para el siguiente turno');
			readkey;
			if (jugadorACT = TOTALJUGADORES) then jugadorACT:= 1
				else jugadorACT:= jugadorACT+1;
		end;
	end;
	writeln('EL JUGADOR ', jugadores[jugadorACT].nom,' GANO.');
	
	// FINALIZO
	writeln('PRECIONE CUALQUIER BOTON PARA CERRAR EL JUEGO');
	readkey;
END.

