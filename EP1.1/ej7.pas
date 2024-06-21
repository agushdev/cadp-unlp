{
    Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un almacén.
La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse. Para cada producto
leído, el programa deberá indicar si el nuevo precio del producto supera en un 10% al precio anterior.
}

program a;

const
    codigo = 32767;
var
    code: integer;
    price,newprice,porc: real;
begin
    code:=-1;
    while (code<>codigo) do
    begin
        write('Introduzca codigo: ');read(code);
        write('Introduzca precio actual: ');read(price);
        write('Introduzca nuevo precio: ');read(newprice);
        porc:= ((newprice - price)/ price)*100;
        if (porc>10) then
        writeln('El aumento de precio del producto ',code,' es superior al 10%')
        else
        writeln('El aumento de precio del producto ',code,' es inferior al 10%');
    end;
end.