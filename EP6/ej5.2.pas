{b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.}

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
    temp:lista;
    totalProductos, productosBajoStock: integer;
begin
    temp:=l;
    totalProductos:=0;
    productosBajoStock:=0;
    while(temp<>nil)do begin
        totalProductos:=totalProductos+1;
        if (temp^.elem.stockActual < temp^.elem.stockMin) then
            productosBajoStock:= productosBajoStock+1;
        temp:= temp^.sig;
    end;

    if (totalProductos>0) then
        writeln('Porcentaje de productos con stock actual por debajo de su stock minimo:',
               (productosBajoStock / totalProductos)*100:0:2,'%')
    else
        writeln('No se ingresaron productos')
end;

procedure digPares(l:lista);
var
    digito,par,codigo:integer;
    temp:lista;
begin
    temp:=l;
    while (temp<>nil) do begin
        codigo:= temp^.elem.codigo;
        par:=0;

        while codigo<>0 do begin
            digito:= codigo mod 10;
            if(digito mod 2 = 0) then
                par:=par+1;
            codigo:= codigo div 10;
        end;
        if (par>=3) then 
            writeln('Descripcion del producto con codigo ', temp^.elem.codigo, ': ', temp^.elem.descripcion);
        temp:=temp^.sig;
    end;
end;

var
    l:lista;
begin
    l:=nil;
    writeln('Ingresar informacion de productos: ');
    cargarLista(l);
    writeln('Lista de productos ingresados: ');
    imprimirLista(l);
    digPares(l);
    porcentaje(l);
end.