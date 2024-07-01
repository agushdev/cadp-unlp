{Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
}

program a;

var
num,total,i:integer;

begin
    total:=0;
    for i:=1 to 10 do begin
        writeln('Ingresar un numero: '); readln(num);
        total:= total + num;
    end;
    writeln('El resultado de la suma es igual a: ',total);
end.