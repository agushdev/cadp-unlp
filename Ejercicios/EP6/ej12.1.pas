{12. Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de
todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android
instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB).
La información disponible se encuentra ordenada por versión de Android. Realizar un programa que procese
la información disponible de todos los dispositivos e informe:

a. La cantidad de dispositivos para cada versión de Android.
}

program a;

type
    dispositivo=record
        versionAndroid:integer;
        tamanioPantalla:integer;
        ram:integer;
    end;

    lista=^nodo;

    nodo=record
        elem:dispositivo;
        sig:lista;
    end;

procedure leerInfo(var d:dispositivo);
begin
    writeln('Ingresar informacion del dispositivo');
    write('Ingresar version de android: '); readln(d.versionAndroid);
    if (d.versionAndroid <> 0) then begin
        write('Ingresar tamanio de pantalla: '); readln(d.tamanioPantalla);
        write('Ingresar cantidad de mem ram: '); readln(d.ram);
    end;
end;

procedure insertarOrdenado(var l:lista; d:dispositivo);
var
    nue,act,ant:lista;
begin
    new(nue);
    nue^.elem:= d;
    act:= l;
    ant:=nil;
    while (act <> nil) and (d.versionAndroid < act^.elem.versionAndroid) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(ant=nil) then begin
       nue^.sig:=l;
       l:=nue; 
    end
    else begin
        ant^.sig:= nue;
        nue^.sig:= act;
    end;
end;

procedure cargarLista(var l:lista);
var
    d:dispositivo;
begin
    leerInfo(d);
    while (d.versionAndroid <> 0) do begin
        insertarOrdenado(l,d);
        leerInfo(d);
    end;
end;

procedure contarDispositivosPorVersion(l:lista);
var
    versionActual, contador:integer;
    aux:lista;
begin
    aux:= l;
    while(aux<>nil) do begin
        versionActual:= aux^.elem.versionAndroid;
        contador:=0;
        while (aux<>nil) and (aux^.elem.versionAndroid = versionActual) do begin
            contador:= contador+1;
            aux:= aux^.sig;
        end;
        writeln('Version ',versionActual,': ',contador,' dispositivos');
    end;
end;

procedure imprimirLista(l: lista);
var
    aux: lista;
begin
    aux := l;
    while (aux <> nil) do
    begin
        writeln('Version Android: ', aux^.elem.versionAndroid);
        writeln('Tamanio Pantalla: ', aux^.elem.tamanioPantalla);
        writeln('RAM: ', aux^.elem.ram);
        writeln('---');
        aux := aux^.sig;
    end;
end;

var
    l:lista;
begin
    l:=nil;
    cargarLista(l);
    imprimirLista(l);
    contarDispositivosPorVersion(l);
end.
