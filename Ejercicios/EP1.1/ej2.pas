// Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un
// número X, se escribe |X| y se define como:
// |X| = X cuando X es mayor o igual a cero
// |X| = -X cuando X es menor a cero

program a;

var
    numReal,numAbsoluto: real;
begin
    write('Ingrese un numero Real ');
	read(numReal);
	if(numReal<0) then
		numAbsoluto:=-(numReal);
	if(numReal>=0) then
		numAbsoluto:= numReal;
	writeln('Su numero absoluto es: ', numAbsoluto:0:2);
end.