{Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.}

program a;

function esDoble(numA, numB: integer):boolean;

begin
esDoble:=numB=numA*2;
end;

var
numA,numB:integer;

begin
read(numA);
read(numB);
esDoble(numA,numB);
if (esDoble(numA,numB))then writeln('Efectivamente es doble!');
end.