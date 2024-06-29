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

// FALTA HACER EL B.2, esta mal hecho. Despues lo actualizo.

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

procedure insertarOrdenado(var l:lista; c:compra);
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

//procedure actualizarMax(var max,max1:integer; dni:integer)

procedure generarLista(l:lista; var l2:lista);
begin
    while (l<>nil)do begin
        if(l^.elem.anio>=2010) and (l^.elem.anio<=2020) then insertarOrdenado(l,l^.elem);
        l:= l^.sig;
    end;
end;

procedure recorrido(l2:lista; var vM:vecMonto);
var
    anioActual: rAnioA;
    max,max1:integer;
    montoTotal:real;
begin
    montoTotal:=0;
    max:= -9999; max1:= -9999;
    while(l2<>nil) do begin
        anioActual:=l2^.elem.anio;
        while(l2<>nil) and (anioActual=l2^.elem.anio)do begin
            vM[anioActual]:= vM[anioActual] + l2^.elem.monto;
            //actualizarMax(max,max1,l2^.elem.dni);
            if ((l^.elem.cod mod 10)=0) then montoTotal:= montoTotal + l2^.elem.monto;
        end;
        l2:= l^.sig;
    end;
    writeln(montoTotal);
    //writeln(max,max1); Esta incompleto y incluso esta mal!
end;

var
    l,l2:lista;
    vM:vecMonto;
    minAnio:integer;
    min:real;
    i:integer;
begin
    l:= nil;
    l2:= nil;
    min:= 9999;
    cargarLista(l);
    inicializarVec(vM);
    generarLista(l,l2);
    recorrido(l2,vM);
    for i:=2010 to 2020 do begin
        if(vM[i] < min) then begin
            minAnio:=i;
            min:=vM[i];
        end;
    end;
    writeln(minAnio); // B.1 COMPLETO
end.