// Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
// reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
// número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.

program a;

type
	numeros = 1 .. 10;

var
    numReal,dobleReal: real;
    contador: numeros;
begin
    contador:=1;
    dobleReal:=0;
    write('Ingrese un numero real: ');
    read(numReal);
    while (dobleReal/2 <> numReal) and (contador>10) do
		begin
            contador:=contador+1;
			read(dobleReal);
			writeln('Su numero es ',dobleReal:2:1);
		end;
	write('El numero que es el doble del real es: ', dobleReal:2:1);
end.