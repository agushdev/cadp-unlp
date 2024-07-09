{TEMA 2-CADP 2024
29/6/2024
Un supermercado está procesando las compras que realizaron sus clientes. Para ello, dispone de una estructura de datos con todas las compras realizadas, 
sin ningún orden en particular. De cada compra se conoce: código, año (entre 1980 y 2024), monto y DNI del cliente. Un cliente puede haber realizado más
de una compra.
Realizar un programa procese la información de las compras y:
a. Almacene en otra estructura de datos las compras realizadas entre los años 2010 y 2020. Esta estructura debe quedar ordenada por el DNI del cliente.
b. Una vez almacenada la estructura del inciso a, procesar estos datos e informar:
1. El año con menor facturación.
2. Los dos DNI de los clientes que realizaron mayor cantidad de compras.
3. COMPLETO: El monto total facturado de compras con código múltiplo de 10.}

program super;

type
    rAnio=1980..2024;
    rAnioA=2010..2020;
    compra=record
        cod:integer;
        anio:rAnio;
        monto:real;
        dni:integer;
    end;
    lista=^nodo;
    nodo=record
        elem:compra;
        sig:lista;
    end;
    vecMonto=array[rAnioA] of real;

procedure cargarLista(var l:lista); // Se dispone

procedure inicializarVec(var vM:vecMonto);
var i:integer;
begin
    for i:=2010 to 2020 do vM[i]:= 0;
end;

procedure insertarOrdenado(var l2:lista; c:compra);
var
    nue, act, ant: lista;
begin
    new(nue);
    nue^.elem := c;
    act := l;
    ant := l;
    while(act <> nil) and (c.dni > act^.elem.dni) do begin //
        ant := act;
        act := act^.sig; 
    end;
    if (act = ant) then
        l := nue
    else 
        ant^.sig := nue;
    nue^.sig := act;
end;

procedure generarLista(l:lista; var l2:lista);
var aux:lista;
begin
    aux:= l;
    while (aux<>nil)do begin
        if(aux^.elem.anio>=2010) and (aux^.elem.anio<=2020) then insertarOrdenado(l2,aux^.elem);
        aux:= aux^.sig;
    end;
end;

procedure actualizarMax(dniActual,cantComprasActual:integer; var dni1,dni2,cantCompras1,cantCompras2:integer);
begin
    if (cantComprasActual > cantCompras1)then begin
        cantCompras2:= cantCompras1;
        dni2:= dni1;
        cantCompras1:= cantComprasActual;
        dni1:= dniActual;
    end else if (cantComprasActual > cantCompras2)then begin
        cantCompras2:= cantComprasActual;
        dni2:= dniActual;
    end;
end;

function peorAnio(var vM:vecMonto): integer;
var 
    minAnio,i:integer;
    min:real;
begin
    min:= 9999;
    for i:=2010 to 2020 do begin
        if(vM[i] < min) then begin
            minAnio:=i;
            min:=vM[i];
        end;
    end;
    peorAnio:= minAnio;
end;

procedure recorrido(l2:lista; var vM:vecMonto);
var
    dniActual, cantComprasActual:integer;
    dni1,dni2,cantCompras1,cantCompras2:integer;
    montoTotal:real;
begin
    montoTotal:=0;
    cantCompras1:=-9999;
    cantCompras2:=-9999;
    while(l2<>nil) do begin
        dniActual:= l2^.elem.dni;
        cantComprasActual:= 0;
        while(l2<>nil) and (dniActual = l2^.elem.dni) do begin
            cantComprasActual:= cantComprasActual + 1;
            vM[l2^.elem.anio]:= vM[l2^.elem.anio] + l2^.elem.monto;
            if ((l^.elem.cod mod 10)=0) then montoTotal:= montoTotal + l2^.elem.monto;
            l2:= l2^.sig;
        end;
        actualizarMax(dniActual,cantComprasActual,dni1,dni2,cantCompras1,cantCompras2);
    end;
    writeln(montoTotal);
    peorAnio(vM);
    writeln(dni1,dni2);
end;

var
    l,l2:lista;
    vM:vecMonto;
begin
    l:= nil;
    l2:= nil;
    cargarLista(l);
    inicializarVec(vM);
    generarLista(l,l2);
    recorrido(l2,vM);
end.