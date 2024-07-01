// Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
// ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído).

program a;

var
    numReal,dobleReal: real;
    cant: integer;
begin
    numReal:=0;
    dobleReal:=0;
    write('Ingrese un numero real: ');
    read(numReal);
    while ((dobleReal/2)<>numReal) do
		begin
            cant:= cant+1;
			read(dobleReal);
			writeln('Su numero es ',dobleReal:2:1);
		end;
	write('El numero que es el doble del real es: ', dobleReal:2:1,' y se intento ',cant,' veces.');
end.
    