{Una empresa de venta de tickets de tren está analizando la información de los viajes realizados 
por sus trenes durante el año 2022. Para ello, se dispone de una estructura de datos con la 
información de todos los viajes. 
De cada viaje se conoce el código de tren, el mes en que se realizó el viaje (entre 1y 12), la 
cantidad de pasajeros que viajaron y el código de la ciudad de destino (entre 1 y 20). La información
se encuentra ordenada por código de tren. 
Además, la empresa dispone de una estructura de datos con información del costo del ticket por ciudad
destino. 

Realizar un programa que procese la información de los viajes y:
A. Generar una lista que tenga por cada código del tren, la cantidad de viajes realizados. 
B. Informe el mes con mayor monto recaudado. 
C. COMPLETO: Informe el promedio de pasajeros por cada tren entre todos sus viajes.
}

program ticketTren;

type
    meses= 1..12;
    destino= 1..20;

    viaje= record
        codTren:integer; // Ordenada por cod tren
        mes:meses;
        cantPasajeros:integer;
        codDestino:destino;
    end;

    lista=^nodo;

    nodo= record
        elem:viaje;
        sig:lista;
    end;

    vectorCostoT= array[destino] of real;

    infoTren= record
        codTren: integer;
        cant: integer;
    end;

    listaTren= ^nodoTren;

    nodoTren=record
        elem:infoTren;
        sig:listaTren;
    end;

    vectorMontoM= array[meses] of real;

procedure cargarListaViaje(var l:lista); // Se dispone
procedure cargarVectorCosto(var v:vectorCostoT); // Se dispone

procedure inicializarVectorMonto(var v:vectorMontoM);
var i:meses;
begin
    for i:=1 to 12 do
        v[i]:= 0;
end;

// A. Generar una lista que tenga por cada código del tren, la cantidad de viajes realizados.
procedure agregarAdelante(var lT:listaTren; tren:infoTren);
var nue:listaTren;
begin
    new(nue);
    nue^.elem:= tren;
    nue^.sig:= lT;
    lT:= nue;
end;

// B. Informe el mes con mayor monto recaudado. 
// C. Informe el promedio de pasajeros por cada tren entre todos sus viajes.

procedure recorrido(l:lista; vC:vectorCostoT; var lT:listaTren; vM:vectorMontoM);
var
    trenActual,cantViajes,cantPasajeros:integer;
    montoTren:real;
    infoT:infoTren;
begin
    while(l<>nil)do begin
        trenActual:= l^.elem.codTren;
        cantViajes:= 0;
        cantPasajeros:= 0;
        while(l<>nil) and (trenActual = l^.elem.codTren)do begin
            cantViajes:= cantViajes+1;
            cantPasajeros:= cantPasajeros + l^.elem.cantPasajeros;
            montoTren:= vC[l^.elem.codDestino] * l^.elem.cantPasajeros;
            vM[l^.elem.mes]:= vM[l^.elem.mes] + montoTren;
            l:= l^.sig;
        end;
        infoT.codTren:= trenActual;
        infoT.cant:= cantPasajeros;
        agregarAdelante(lT,infoT);
        writeln('Promedio de pasajeros del tren: ',trenActual, 'es de:',cantPasajeros/cantViajes:0:2);
    end;
end;

// B. Informe el mes con mayor monto recaudado. 
procedure montoMayor(v:vectorMontoM);
var
    montoMax:real; mesMax,i:meses;
begin
    montoMax:= -1;
    for i:=1 to 12 do begin
        if(v[i] > montoMax)then begin
            montoMax:= v[i];
            mesMax:= i;
        end;
    end;
    writeln('El mes con mayor recaudacion es: ',mesMax,' con un total de: ',montoMax);
end;

var
    l:lista; lt:listaTren;
    vC:vectorCostoT; vM:vectorMontoM;
begin
    l:=nil;
    lT:=nil;
    cargarListaViaje(l);
    cargarVectorCosto(vC);
    inicializarVectorMonto(vM);
    recorrido(l,vC,lT,vM);
end.