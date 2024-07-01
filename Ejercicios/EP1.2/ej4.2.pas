{Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son los dos
números mínimos leídos.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer el
número 0, el cual no debe procesarse.
}

program a;

var
num,min1,min2,i: integer;

begin
    min1:=9999;
    min2:=9999;
    write('Ingrese un numero: '); readln(num);
    while (num<>0) do begin
        if(num<min1) then begin
            min2:= min1;
            min1:= num;
        end
        else if (num < min2) then
            min2:=num;
        writeln('Ingrese un numero: '); readln(num);
    end;
    writeln('El primer minimo es: ',min1);
    writeln('El segundo minimo es: ',min2);
end.