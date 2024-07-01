{Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.}

program a;

procedure cantSumaDigitos (numero:integer; var cantDigitos:integer; var sumaDigitos:integer);
var
    digito:integer;
begin
    cantDigitos:=0;
    sumaDigitos:=0;
    while(numero<>0) do begin
        digito:= numero mod 10; // obtiene el primer digito
        cantDigitos:= cantDigitos+1; // incrementa el contador de digitos
        sumaDigitos:= sumaDigitos+digito; // incrementa la suma de digitos
        numero:= numero div 10; // elimina el ultimo digito
    end;
end;

var
    numero, cantDigitos, sumaDigitos, cantTotalDigitos: integer;

begin
    cantTotalDigitos:=0;
    repeat
        write('Ingrese un numero: '); readln(numero);

        cantSumaDigitos(numero, cantDigitos, sumaDigitos);

        cantTotalDigitos := cantTotalDigitos + cantDigitos;

        writeln('Cantidad de digitos: ', cantDigitos);
        writeln('Suma de los digitos: ', sumaDigitos);

    until (sumaDigitos = 10);

    writeln('La cantidad de digitos es de: ',cantTotalDigitos);
end.
