{Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se ingrese el
número 100, el cual debe procesarse. Informar en pantalla:
● El número máximo leído.
● El número mínimo leído.
● La suma total de los números leídos.
}

program a;

var
num,max,min,total: integer;
begin
    max:=-9990;
    min:=9999;
    total:=0;
    repeat
        write('Ingrese un numero: '); readln(num);
        if(num>max)then
            max:=num;
        if(num<min)then
            min:=num;
        total:= total+num;
    until (num=100);
    writeln('El numero maximo leido es: ',max);
    writeln('El numero minimo leido es: ',min);
    writeln('La suma total de los numeros leidos es de: ',total);
    
end.