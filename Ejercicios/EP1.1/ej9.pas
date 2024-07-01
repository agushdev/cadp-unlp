{Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro carácter,
debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse una secuencia
de números enteros que finaliza con 0. El programa deberá aplicar la operación leída con la secuencia de
números, e imprimir el resultado final.
Por ejemplo:
○ Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
○ Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir: 0 (-10 + 5 + 6 + (-1))}

program a;

var
operacion: char;
num,resultado: integer;
error: boolean;

begin
    resultado:=0;
    writeln('Ingrese operacion con caracter: '); readln(operacion);
    if(operacion = '-') then begin
        writeln('Ingrese un numero: '); readln(num);
        while(num<>0) do begin
            resultado:= num - resultado;
            writeln('Ingrese un numero: '); readln(num);
        end;
    end
    else
        if(operacion = '+') then begin
            writeln('Ingrese un numero: '); readln(num);
            while(num<>0) do begin
                resultado:= num + resultado;
                writeln('Ingrese un numero: '); readln(num);
        end;
        end
    else begin
        write('ERROR');
        error:= true;
        end;
    if (error = false) then
        writeln('El resultado es: ',resultado);
    
end.