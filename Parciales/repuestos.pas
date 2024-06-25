{ Un fabricante de dispositivos electronicos desea procesar informacion de repuestos que compro.
El fabricante dispone de una estructura de datos con los nombres de los 200 paises de los cuales provienen repuestos,
en la que para cada codigo de pais (1..200) se tiene su nombre.

Realizar un programa que:

A) Lea la informacion de repuestos comprados y la almacene en una estructura de datos adecuada.
De cada repuesto se lee codigo, precio y codigo del pais del que provienen (entre 1 y 200). La lectura finaliza al ingresar el codigo -1 (que no debe procesarse).

B) Una vez cargada la informacion, procese la estructura de datos del Inciso A e informe:
    1- Cantidad de paises para los que la cantidad de repuestos comprados es menor que el promedio de repuestos comprados a todos los paises.
    2- Para cada pais el nombre del pais y el precio del repuesto mas caro.
    3- La cantidad de repuestos que poseen al menos 3 ceros en su codigo.
    
Implemente el programa principal que invoque a los modulos de los incisos a y b, e imprime los resultados.}

program repuestos;

const
    paises=200;
type
    rangoPais=[1..paises]
    vectorPaises= array [rangoPais] of string;

    infoRepuesto=record
        cod: integer;
        precio: real;
        codPais: rangoPais;
    end;

    lista= ^nodo;
    nodo=record
        elem: infoRepuesto;
        sig: lista
    end;

    vectorRepuestosPais= array[rangoPais] of integer;
    vectorPrecioCaroPais= array[rangoPais] of real;

procedure cargarVector(var vPais: vectorPaises); // Se dispone

procedure inicializarVectores(var vR:vectorRepuestosPais; var vP:vectorPrecioCaroPais);
var i:integer;
begin
    for i:=1 to paises do begin
        vR[i]:= 0;
        vP[i]:=0;
    end;    
end;

procedure leerRepuesto(var info:infoRepuesto);
begin
    readln(info.cod);
    if (info.cod <> -1)then begin
        readln(info.precio);
        readln(info.codPais);
    end;
end;

procedure agregarAdelante(var l:lista; info:infoRepuesto);
var nue:lista;
begin
    new(nue);
    nue^.elem:= info;
    nue^.sig:= lista;
    l:= nue;
end;

procedure cargarLista(var l:lista);
var info:infoRepuesto;
begin
    leerRepuesto(info);
    while(info.cod <> -1)do begin
        agregarAdelante(l,info);
        leerRepuesto(info);
    end;
end;

function almenos3ceros(num:integer): boolean;
var dig,cont:integer;
begin
    cont:=0;
    while (num<>0) and (cont < 3) do begin
        dig:= num mod 10;
        if(dig=0)then cont:=cont+1;
        dig:= num div 10;
    end;
    almenos3ceros:= cont>=3;
end;

procedure maximo(var max: real; precioActual:real);
begin
    if (precioActual > max)then max:=precioActual;
end;

procedure recorrerLista(l:lista; var vR:vectorRepuestosPais; var vP:vectorPrecioCaroPais);
var 
    paisActual:rangoPais;
    cont:integer;
begin
    cont:=0;
    while (l<>nil) do begin
        paisActual:= l^.elem.codPais;
        while(l<>nil) and (paisActual <> l^.elem.codPais)do begin
            vR[paisActual]:= vR[paisActual] + 1;
            if (almenos3ceros=true)then cont:= cont+1;
            maximo(vP[paisActual], l^.elem.precio);
            l:= l^.sig;
        end;
        l:= l^.sig;
    end;
    writeln('La cantidad de codigos con al menos 3 ceros es de: ',cont);
end;

function cantPaisesMenorAlPromedio(vR:vectorRepuestosPais): integer;
var
    promedio: real;
    suma,cant,i:integer;
begin
    suma:= 0;
    for i:=1 to paises do suma:= suma + vR[i];

    promedio:= suma / paises;

    for i:=1 to paises do
        if (vR[i] < promedio) then cant:= cant+1;

    cantPaisesMenorAlPromedio:= cant;
end;

procedure informarAyB(vPaises:vectorPaises; vR:vectorRepuestosPais; vP:vectorPrecioCaroPais);
begin
    for i to paises do begin
        writeln('El repuesto mas caro del pais: ',vPaises[i], 'es de : ',vP[i]);
    end;
    writeln('Cantidad de paises con la cantidad de repuestos comprados menor al promedio total es de: ',cantPaisesMenorAlPromedio(vR));
end;

var
    l:lista;
    vR:vectorRepuestosPais;
    vP:vectorPrecioCaroPais;
    vPaises: vectorPaises;
begin
    l:=nil;
    inicializarVectores(vR,vP);
    cargarVector(vPaises);
    cargarLista(l);
    recorrerLista(l,vR,vP);
    informarAyB(vPaises,vR,vP);
end.

