{CADP 2023 - Parcial - Primera Fecha - 10/6/2023-TEMA 1-8:00 AM
Una empresa de venta de pasajes aéreos está analizando la información de los viajes realizados por sus aviones. 
Para ello, se dispone de una estructura de ciatos con la información de todos los viajes. De cada viaje se conoce el código de avión (entre 1000 y 2500), 
el año en que se realizó el viaje, la cantidad de pasajeros que viajaron, y la ciudad de destino. La información no se encuentra ordenada por ningún criterio.
Además, la empresa dispone de una estructura de datos con información sobre la capacidad máxima de cada avión.
Realizar un programa que procese la información de los viajes e:

A. Informe el código del avión que realizó la mayor cantidad de viajes
B. Genere una lista con los viajes realizados en años múltiplo de 10 con destino "Punta Cana" en los que el avión no alcanzó su capacidad máxima
C. COMPLETO: Para cada avión, informe el promedio de pasajeros que viajaron entre todos sus viajes}

program viajesAereos;
type
    rangoAvion= 1000..2500;
    infoAvion= record
        codAvion: rangoAvion;
        anio: integer;
        cantPasajeros: integer;
        destino: string[20];
    end;
    
    lista=^nodo; // Se dispone
    nodo= record
        elem:infoAvion;
        sig:lista
    end;
    vectorCapacidad= array[rangoAvion] of integer; // Se dispone
    vectorContViaje= array[rangoAvion] of integer;
    vectorPasajeros= array[rangoAvion] of integer;

procedure cargarLista(var l:lista); // Se dispone
procedure cargarVector(var vC:vectorCapacidad); // Se dispone

procedure inicializarVectores(var vCont:vectorContViaje; var vPas:vectorPasajeros);
var i:integer;
begin
    for i:=1000 to 2500 do begin
        vCont[i]:=0;
        vPas[i]:=0;
    end;
end;

function maximo(v:vectorContViaje): integer;
var
    i,maxAvion: rangoAvion;
    maxViajes: integer;
begin
    maxViajes:=-1;
    for i:=1000 to 2500 do begin
        if (v[i] > maxViajes) then begin
            maxViajes:= v[i];
            maxAvion:= i;
        end;
    end;
    maximo:= maxAvion;
end;

function cumple(viaje:infoAvion; v:vectorCapacidad): boolean;
begin
    cumple:= (viaje.anio MOD 10 = 0) and (viaje.destino = 'Punta Cana') and (viaje.cantPasajeros < v[viaje.codAvion]);
end;

procedure agregarAdelante(var l:lista; info:infoAvion);
var nue:lista;
begin
    new(nue);
    nue^.elem:= info;
    nue^.sig:= lista;
    l:=nue;
end;

procedure procesarViajes(l:lista; vCap:vectorCapacidad; var vCont:vectorContViaje; var vPas:vectorPasajeros; var lista2:lista);
var
    avionActual: rangoAvion;
begin
    lista2:=nil;
    while(l<>nil)do begin
        avionActual:= l^.elem.codAvion;
        vCont[avionActual]:= vCont[avionActual] + 1;
        vPas[avionActual]:= vPas[avionActual] + l^.elem.cantPasajeros;
        if (cumple(l^.elem,vCap)) then
            agregarAdelante(lista2,l^.elem);
        l:= l^.sig;
    end;
end;

var
    l,l2:lista;
    vCap:vectorCapacidad; vCont:vectorContViaje; vPas:vectorPasajeros;
    avionMax: rangoAvion;
    i:integer;
begin
    l:=nil;
    cargarLista(l);
    cargarVector(vCap);
    inicializarVectores(vCont,vPas);
    procesarViajes(l,vCap,vCont,vPas,l2);

    avionMax:= maximo(vCont);
    writeln('El avion que realizo mas viajes es: ',avionMax);

    for i:=1000 to 2500 do begin
        writeln('El promedio de pasajeros del avion: ',i,' es de: ',vPas[i]/vCont[i]);
    end;
end.