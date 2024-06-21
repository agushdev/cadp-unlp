{Realizar un programa que lea información de 200 productos de un supermercado. De cada producto se lee
código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
● Los códigos de los dos productos más baratos.
● La cantidad de productos de más de 16 pesos con código par.
}

program a;

var
code,precioMin1,precioMin2,cantPar,i: integer;
precio: real;

begin
cantPar:=0;
precioMin1:=9999;
precioMin2:=9999;
for i:=1 to 10 do begin
    write('Ingresar codigo: '); readln(code);
    write('Ingresar precio: '); readln(precio);
    if (precio<preciomin1)then begin
        preciomin2:=preciomin1;
        preciomin1:=code;
    end
    else
        if(precio<preciomin2) then
            preciomin2:=code;
    if (precio > 16) then begin
        if((code MOD 2) = 0) then
            cantPar:= cantPar+1;
    end;
end;
writeln('El codigo del producto mas barato: ',preciomin1);
writeln('El codigo del segundo producto mas barato: ',precioMin2);
writeln('El total de productos mayor a 16 pesos con codigo par: ',cantPar);

end.