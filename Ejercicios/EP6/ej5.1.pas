{5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.}

program a;

type
    productos= record
        codigo:integer;
        descripcion:string[40];
        stockActual:integer;
        stockMin:integer;
        precio:integer;
    end;

    lista=^nodo;

    nodo=record
        elem:productos;
        sig:lista;
    end;

procedure leerProductos(var p:productos);
begin
    write('Ingrese codigo del producto: '); readln(p.codigo);
    if (p.codigo <> -1) then begin
        write('Ingrese descripcion del producto: '); readln(p.descripcion);
        write('Ingrese stock actual del producto: '); readln(p.stockActual);
        write('Ingrese stock minimo del producto: '); readln(p.stockMin);
        write('Ingrese precio del producto: '); readln(p.precio);
    end;
end;

procedure agregarAdelante(var l:lista; p:productos);
var nue:lista;
begin
    new(nue);
    nue^.elem:=p;
    nue^.sig:=l;
    l:=nue;
end;

procedure cargarLista(var l:lista);
var p:productos;
begin
    leerProductos(p);
    while(p.codigo <> -1) do begin
        agregarAdelante(l,p);
        leerProductos(p);
    end;
end;

procedure imprimirLista (l:lista);
begin
    while (l<>nil) do begin
        writeln('Codigo: ', l^.elem.codigo, ' Descripcion: ', l^.elem.descripcion, ' Stock actual: ',
                l^.elem.stockActual, ' Stock minimo: ', l^.elem.stockMin, ' Precio: ', l^.elem.precio);
        l:=l^.sig;
    end;
end;

procedure porcentaje(var l:lista); //a. Porcentaje de productos con stock actual por debajo de su stock mínimo.}
var
    totalProductos, productosBajoStock: integer;
begin
    totalProductos:=0;
    productosBajoStock:=0;
    while(l<>nil)do begin
        totalProductos:=totalProductos+1;
        if (l^.elem.stockActual < l^.elem.stockMin) then
            productosBajoStock:= productosBajoStock+1;
        l:= l^.sig;
    end;

    if (totalProductos>0) then
        writeln('Porcentaje de productos con stock actual por debajo de su stock minimo:',
               (productosBajoStock / totalProductos)*100:0:2,'%')
    else
        writeln('No se ingresaron productos')
end;

var
    l:lista;
begin
    l:=nil;
    writeln('Ingresar informacion de productos: ');
    cargarLista(l);
    writeln('Lista de productos ingresados: ');
    imprimirLista(l);
    porcentaje(l);
end.