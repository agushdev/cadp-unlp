{Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio.}

program a;

const 
cantProductos = 3; // uso constante para facilitar el programa. deberian de ser 100 productos

// paso por referencia los parametros porque quiero que se modifiquen en el programa principal
procedure leerProducto(var precio:real; var codigo:integer; var tipo:string); 
begin
write('Ingrese el precio del producto: '); readln(precio);
write('Ingrese el codigo del producto: '); readln(codigo);
write('Ingrese el tipo del producto: '); readln(tipo);
end;

//paso por referencia todas las variables min y por valor el precio y code
procedure actualizarMinimo(precio:real; codigo:integer; var min1:real; var min2:real; var minCod1:integer; var minCod2:integer);
begin
    if(precio<min1)then begin
        min2:=min1;
        minCod2:=minCod1;
        min1:=precio;
        minCod1:=codigo;
    end
    else if (precio < min2) then begin
        min2:=precio;
        minCod2:=codigo;
    end;
end;

//paso por referencia las variables max y por valor el precio, code y tipo
procedure actualizarMaximoPantalon(precio:real; codigo:integer; tipo:string; var maxPantalon:real; var maxCodPantalon:integer);
begin
    if (tipo = 'pantalon') then begin
        if (precio > maxPantalon) then begin
            maxPantalon:=precio;
            maxCodPantalon:=codigo;
        end;
    end;
end;

var
precio,min1,min2,suma,maxPantalon:real;
i,codigo,minCod1,minCod2,maxCodPantalon:integer;
tipo:string;

begin
    min1:=9999;
    min2:=9999;
    minCod1:=-1;
    minCod2:=-1;
    maxPantalon:=-1;
    suma:=0;

    for i:=1 to cantProductos do begin
        leerProducto(precio, codigo, tipo); // leo datos de productos

        // codigo de los dos productos mas baratos
        actualizarMinimo(precio, codigo, min1, min2, minCod1, minCod2);

        // codigo del producto de tipo pantalon más caro
        actualizarMaximoPantalon(precio, codigo, tipo, maxPantalon, maxCodPantalon);

        // Precio promedio
        suma:=suma+precio;
    end;
    writeln('////////////////////////');
    writeln('El codigo del producto mas barato es: ', minCod1);
    writeln('El codigo del segundo producto mas barato es: ', minCod2);
    writeln('////////////////////////');
    writeln('El codigo del pantalon mas caro es: ', maxCodPantalon);
    writeln('////////////////////////');
    writeln('El precio promedio es: ', (suma/cantProductos):0:2);
    writeln('////////////////////////');
end.
