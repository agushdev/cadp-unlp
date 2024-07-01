// Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
// dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
// son iguales”

program a;

var
    num1,num2: integer;
begin
    write('Ingrese un valor para el primer numero: ');
    read(num1);
    write('Ingrese un valor para el segundo numero: ');
    read(num2);

    if (num1<num2) then
		write('El numero menor es: ',num1);
	if (num1>num2) then
		write('El numero menor es: ',num2)
	else
		write('Los numeros leidos son iguales');
end.