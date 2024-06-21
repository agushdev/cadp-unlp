{Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son los dos
números mínimos leídos.}

program a;

var
num,min1,min2,i: integer;

begin
    min1:=9999;
    min2:=9999;
    for i:=1 to 10 do begin
        write('Ingrese un numero: '); readln(num);
        if(num<min1) then begin
            min2:= min1;
            min1:= num;
        end
        else if (num < min2) then
            min2:=num;
    end;
    writeln('El primer minimo es: ',min1);
    writeln('El segundo minimo es: ',min2);
end.