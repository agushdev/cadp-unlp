{Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de
2020. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de
destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código
de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.}

program a;

type
    viaje=record
        nroViaje:integer;
        codAuto:integer;
        destino:string[20];
        kmRecorridos:integer;
    end;

    lista=^nodo;
    nodo=record
        elem:viaje;
        sig:lista;
    end;

procedure leerViaje(var via:viaje);

procedure agregarOrdenado(var l:lista; via:viaje);

procedure cargarLista(var l:lista);
var via:viaje;

procedure informarA(l:lista);
var
    valorMax1,valorMax2,codeMax1,codeMax2:integer;
begin
    valorMax1:=-9999;
    while(l<>nil) do begin
        if(l^.elem.kmRecorridos > valorMax1) then begin
            valorMax2:= valorMax1;
            codMax2:= codeMax1;
            valorMax1:= l^.elem.kmRecorridos;
            codeMax1:= l^.elem.codAuto;
        end
        else if begin
            if(l^elem.kmRecorridos > valorMax2)then begin
                valorMax2:= l^.elem.kmRecorridos;
                codeMax2:= l^.elem.codAuto;
            end;
        end;
        l:= l^.sig;
    end;
    writeLn('El primer code max: ',codeMax1,' es de: ',valorMax1,' kms recorridos.');
    writeLn('El segundo code max: ',codeMax2,' es de: ',valorMax2,' kms recorridos.');
end;

procedure agregarOrdenado(var l2:lista; via:viaje);
var
    ant,nue,act:lista;
begin
    new(nue);
    nue^.elem:=via;
    act:=l2;
    ant:=l2;
    while(act<>nil) and (l^.elem.nroViaje < via.nroViaje) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(act=ant) then
        l2:=nue;
    else
        ant^.sig:=nue;
    nue^.sig:=act;
end;

procedure informarB(l:lista; var l2:lista);
var
    cantKm:integer;
begin
    while(l<>nil) do begin
        cantKm:=0;
        while(l<>nil) and (l^.elem.codAuto) do begin
            if(l^.elem.kmRecorridos > 5) then
                agregarOrdenado(l2,l^.elem);
            cantKm:= cantKm + l^.elem.kmRecorridos;
            l:=l^.sig;
        end;
    end;
end;

var
    l,l2:lista;
begin
    l:=nil;
    l2:=nil;
    cargarLista(l); //se dispone
    informarA(l);
    informarB(l,l2);
end;