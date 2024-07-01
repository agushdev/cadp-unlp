{Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5.
}

program a;

var
num,total,mayor,i:integer;

begin
    total:=0;
    for i:=1 to 10 do begin
        writeln('Ingresar un numero: '); readln(num);
        total:= total + num;
        if (num>5) then
            mayor:= mayor+1;
    end;
    writeln('El resultado de la suma es igual a: ',total);
    writeln('La cantidad de numeros mayores a 5 es de: ',mayor);
end.