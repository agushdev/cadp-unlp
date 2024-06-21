{c. El tamaño promedio de las pantallas de todos los dispositivos.}

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

{b. La cantidad de dispositivos con mas de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.}

procedure cantDispositivos(l:lista);
var
    contador:integer;
    aux:lista;
begin
    contador:=0;
    aux:=l;
    while (aux<>nil) do begin
        if (aux^.elem.ram > 3) and (aux^.elem.tamanioPantalla <= 5) then
            contador:= contador+1;
        aux:= aux^.sig;
    end;
    writeln('Cantidad de dispositivos con mas de 3 GB de memoria y pantallas de a lo sumo 5 pulgadas: ', contador);
end;

{c. El tamaño promedio de las pantallas de todos los dispositivos.}

procedure promedioPantalla(l:lista);
var
    sumaPantallas,contador:integer;
    aux:lista;
    promedio:real;
begin
    aux:=l;
    contador:=0;
    sumaPantallas:=0;
    while (aux <> nil) do begin
        contador:= contador+1;
        sumaPantallas:= sumaPantallas+aux^.elem.tamanioPantalla;
        aux:= aux^.sig;
    end;
    
    if (contador <> 0) then
        promedio:= sumaPantallas / contador
    else 
        promedio:=0;
     writeln('El tamanio promedio de las pantallas de todos los dispositivos es: ', promedio:0:2, ' pulgadas');
end;

var
    l:lista;
begin
    l:=nil;
    cargarLista(l);
    imprimirLista(l);
    contarDispositivosPorVersion(l);
    cantDispositivos(l);
    promedioPantalla(l);
end.
