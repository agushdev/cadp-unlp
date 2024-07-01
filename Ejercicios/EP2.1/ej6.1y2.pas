{Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
Implemente un programa que invoque al módulo del inciso a.}

program a;


procedure numPar();
var num,numPar:integer;
begin
    numPar:=0;
    write('Ingresar numero: '); readln(num);
    while(num>=0) do
        begin
            if((num MOD 2)= 0) AND (num > numPar) then
                numPar:= num;
            write('Ingresar numero: '); readln(num);
        end;
    writeln('El numero par maximo leido es: ',numPar);
end;

begin
    numPar();
end.