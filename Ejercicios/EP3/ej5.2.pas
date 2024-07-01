{Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}

program a;

type
    str20=string[20];
    auto=record
        marca: str20;
        modelo: str20;
        precio: real;
    end;

procedure leerInfo(var a:auto);
begin
    write('Ingresar marca del auto: '); readln(a.marca);
    write('Ingresar modelo del auto: '); readln(a.modelo);
    write('Ingresar el precio del auto: '); readln(a.precio);
end;

procedure actualizarMaximo(var marcaModelo:auto;var marcaCara,modeloCaro:str20; var precioCaro:real);
begin
    if (precioCaro<marcaModelo.precio)then begin
        precioCaro:= marcaModelo.precio;
        marcaCara:= marcaModelo.marca;
        modeloCaro:= marcaModelo.modelo;
    end;
end;

var
    autito:auto;
    precioPromedio,precioTotal,precioCaro:real;
    cantAutos:integer;
    marcaCara,modeloCaro:str20;

begin
    marcaCara:='';
    modeloCaro:='';
    precioCaro:=0;
    precioPromedio:=0;
    precioTotal:=0;
    cantAutos:=0;
    leerInfo(autito);
    while (autito.marca <> 'ZZZ') do begin
        precioTotal:= precioTotal + autito.precio;
        cantAutos:= cantAutos+1;
        actualizarMaximo(autito,marcaCara,modeloCaro,precioCaro);
        leerInfo(autito);
    end;

    precioPromedio:=precioTotal/cantAutos;

    if (cantAutos > 0) then begin
        writeln('El precio promedio de todos los autos es: ', precioPromedio:0:2);
    end else begin
        writeln('No se ingresaron autos.');
    end;
    writeln('El auto mas caro es de: ',precioCaro:0:2,' su marca es: ',marcaCara,' y su modelo es: ',modeloCaro);
end.