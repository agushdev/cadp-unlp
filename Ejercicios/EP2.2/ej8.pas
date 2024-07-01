{Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega el
número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee.}

program a;

procedure digitosParImpar (numero:integer; var sumaPares:integer; var cantDigImpares:integer);
var digito:integer;
begin
    while (numero<>0) do begin
        digito:= numero mod 10; // obtiene el primer digito
        if (digito mod 2 = 0) then begin
            sumaPares := sumaPares + digito; // sumo el digito a la suma de pares
        end
        else // si es impar
            cantDigImpares := cantDigImpares+1;
        numero := numero div 10; // elimina el ultimo digito
    end;
end;

var
numero, sumaPares, cantDigImpares:integer;

begin
    write('Ingrese un numero: '); readln(numero);
    while (numero<>123456) do // corta con 123456, NO DEBE PROCESARSE se usa while
     begin
        sumaPares:=0;       // inicializar en 0 en el while, para resetear valores procesados anteriormente
        cantDigImpares:=0;

        digitosParImpar(numero,sumaPares,cantDigImpares); // procesar numero para sumar pares y contar impares

        writeln('La suma de los digitos pares es: ', sumaPares); //muestro los resultados por cada numero procesado
        writeln('La cantidad de digitos impares es: ', cantDigImpares);

        write('Ingrese un numero: '); 
        readln(numero); // leer el siguiente numero
    end;
    writeln('Fin del programa.');
end.