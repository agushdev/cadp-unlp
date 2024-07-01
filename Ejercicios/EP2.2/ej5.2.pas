{b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de
pares en las que numB es el doble de numA.
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores
4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}

program a;

function esDoble(numA, numB: integer):boolean;

begin
esDoble:=numB=numA*2;
end;

var
numA,numB:integer;
cantPares,cantDobles:integer;

begin
cantPares:=0; // INICIALIZAMOS EN 0
cantDobles:=0;

writeln('Ingrese un par de numeros (numA,numB): '); // LEEMOS NUMA Y NUMB
readln(numA);
readln(numB); 

while ((numA<>0) AND (numB<>0)) do begin
    cantPares:= cantPares+1;
    if esDoble(numA,numB) then
        cantDobles:= cantDobles+1;
    writeln('Ingrese un par de numeros (numA,numB): '); // leo el siguiente par de numeros
    readln(numA);
    readln(numB);
end;

writeln('La cantidad de Pares fueron de: ',cantPares);
writeln('La cantidad de Dobles fueron de: ',cantDobles);

end.