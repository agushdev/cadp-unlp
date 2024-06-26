{Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.}

program a;

type

cliente=record
    codigoCliente:integer;
    cantLineas:integer;
end;

linea=record
    numeroDeTelefono:integer;
    cantMinutosConsumidos:integer;
    cantMegasConsumidas:integer;
end;

procedure lineaTelefono (var l:linea);
begin
    write('Ingrese su numero de telefono: '); readln(l.numeroDeTelefono);
    write('Ingrese la cantidad de minutos consumidos en el mes: '); readln(l.cantMinutosConsumidos);
    write('Ingrese la cantidad de megas consumidas en el mes: '); readln(l.cantMegasConsumidas);
end;

procedure leerInfo(var c:cliente);
begin
    write('Ingrese su codigo de cliente: '); readln(c.codigoCliente);
    write('Ingrese la cantidad de lineas a su nombre: '); readln(c.cantLineas);
end;

var
c:cliente;
l:linea;
i:integer;
cantTotalMinuto,cantTotalMega:integer;
facturaMinuto,facturaMega:real;
begin
    cantTotalMinuto:= 0;
    cantTotalMega:= 0;
    leerInfo(c);
    for i:=1 to c.cantLineas do begin
        lineaTelefono(l);
        cantTotalMinuto:=cantTotalMinuto + l.cantMinutosConsumidos;
        cantTotalMega:=cantTotalMega + l.cantMegasConsumidas;
    end; 
    facturaMinuto:=cantTotalMinuto * 3.4;
    facturaMega:=cantTotalMega * 1.35;
    writeln('La factura por el total de minutos es: ', facturaMinuto:0:2);
    writeln('La factura por el total de megas es: ', facturaMega:0:2);
end.