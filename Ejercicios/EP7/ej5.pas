{Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100 camiones. 
De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en toneladas que puede transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa.

De cada viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en kilómetros 
recorrida, ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura finaliza cuando se lee el código de viaje -1.

Una vez leída y almacenada la información, se pide:

1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que menos kilómetros recorridos posee.

2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en que se realizó el viaje).

3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.}

program transporteCarga;

const
    camiones=100;
type
    rangoCamiones=1..camiones;

    infoCamion=record
        patente:integer;
        anioFabricacion:integer;
        capacidad:integer;
    end;

    infoViaje=record
        codViaje:integer;
        codCamion:rangoCamiones;
        kmRecorrido:integer;
        ciudadDestino:string[20];
        anioViaje:integer;
        dniChofer:integer;
    end;

    lista=^nodo;
    nodo=record
        elem:infoViaje;
        sig:lista;
    end;

    vectorCamiones=array[rangoCamiones] of infoCamion;

procedure cargarVector(var v:vectorCamiones); // se dispone

procedure leerViaje(var viaje:infoViaje);
begin
    readln(viaje.codViaje);
    if (viaje.codViaje <> -1) then begin
        readln(viaje.codCamion);
        readln(viaje.kmRecorrido);
        readln(viaje.ciudadDestino);
        readln(viaje.anioViaje);
        readln(viaje.dniChofer);
    end;
end;

procedure ingresarAdelante(var l:lista; viaje:infoViaje);
var nue:lista;
begin
    new(nue);
    nue^.elem:=viaje;
    nue^.sig:=l;
    l:=nue;
end;

procedure cargarLista(var l:lista);
var viaje:infoViaje;
begin
    leerViaje(viaje);
    while(viaje.codViaje <> -1) do begin
        ingresarAdelante(l,viaje);
        leerViaje(viaje);
    end;
end;

// 1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que menos kilómetros recorridos posee.
procedure informarA(v:infoViaje; var maxKM,maxPatente,minKM,minPatente:integer);
begin
    if (v.kmRecorrido>maxKM) then begin
        maxKM:= v.kmRecorrido;
        maxPatente:= v.codCamion;
    end;
    if (v.kmRecorrido<minKM) then begin
        minKM:= v.kmRecorrido;
        minPatente:= v.codCamion;
    end;
end;

// 2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
// toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en que se realizó el viaje).
procedure informarB(v:vectorCamiones; var cant:integer);
var i:integer;
begin
    for i:=1 to camiones do begin
        if (v.capacidad[i]<30.5) then // No cumplo con la antiguedad mayor a 5.
            cant:= cant + 1;
    end;
end;

// 3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
// Nota: Los códigos de viaje no se repiten.
procedure informarC(dni:integer; codigo:integer);
var 
    dig:integer;
    cumple:boolean
begin
    cumple:=true;
    while(dni<>0) and (cumple=true) do begin
        dig:= dni mod 10;
        if((dig mod 2) = 0) then
            cumple:= false;
        dni:= dni div 10;
    end;
    if (cumple = true)then
        writeln(codigo);
end;

procedure recorrerLista(l:lista; v:vectorCamiones);
var
    maxPatente,minPatente,maxKM,minKM,capacidadMayor:integer;
begin
    capacidadMayor:= 0;
    maxPatente:= -1;
    maxKM:= -1;
    minPatente:= 9999;
    minKM:= 9999;
    while (l<>nil)do begin
        informarA(l^.elem, maxKM, maxPatente, minKM, minPatente);
        informarB(v, capacidadMayor);
        informarC(l^.elem.dniChofer, l^.elem.codViaje);
        l:= l^.sig;
    end;
end;

var
    l:lista;
    v:vectorCamiones;
begin
    l:=nil;
    cargarVector(vectorCamiones); // Se dispone
    cargarLista(l);
    recorrerLista(l,v);
end;