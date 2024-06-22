{El productor musical Bizarrap organiza sesiones musicales con diferentes artistas.
Implementar un programa que lea y almacene información de dichas sesiones. De cada sesión se lee: titulo de sesión, nombre del artista, genero
musical(1: Trap Latino, 2: Reggaeton, 3: Urban, 4: Electrónica, 5: Pop Rap) y cantidad de visualizaciones en YouTube.

La lectura finaliza cuando se lee la sesion del artista con nombre "Peso Pluma", la cual debe procesarse. 
La información debe quedar almacenada en una estructura de datos ordenada por título de sesión de forma ascendente.

Una vez leída y almacenada la información, se pide:

A) Informar los dos codigos de genero musical con mayor cantidad de visualizaciones en YouTube.

B) Informar la cantidad de sesiones del género "Reggaeton" cuya cantidad de visualizaciones contiene la misma
cantidad de dígitos pares que impares.

C) COMPLETO: Realizar un módulo que reciba un título de sesión y elimine dicha sesion de la estructura. El título de 
sesion puede no existir. Invocar el módulo desarrollado en el programa principal con titulo leído por teclado.}

program biza;

const
    generos=5;
type
    rangoGenero=1..generos;

    sesion=record
        titulo:string[20];
        artista:string[20];
        genero:rangoGenero;
        visitas:integer;
    end;

    lista=^nodo;

    nodo=record
        elem:sesion;
        sig:lista;
    end;

    vector= array [rangoGenero] of integer;

procedure leerSesion(var s:sesion);
begin
    readln(s.titulo);
    readln(s.artista);
    readln(s.genero);
    readln(s.visitas);
end;

procedure insertarOrdenado(var l:lista; s:sesion); //ordenada por título de sesión de forma ascendente
var
    nue,act,ant:lista;
begin
    new(nue);
    nue^.elem:= s;
    ant:= l;
    act:= l;
    while (act <> nil) and (s.titulo > act^.elem.titulo)do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (act=ant)then
        l:=nue
    else
        ant^.sig:= nue;
    nue^.sig:= act;
end;

procedure cargarLista(var l:lista);
var s:sesion;
begin
    repeat
        leerSesion(s);
        insertarOrdenado(l,s);
    until (s.artista = 'Peso Pluma');
end;

procedure inicializarVec(var v:vector);
var i:integer;
begin
    for i:=1 to generos do begin
        v[i]:=0;
    end;
end;

// B) Informar la cantidad de sesiones del género "Reggaeton" cuya cantidad de visualizaciones contiene la misma cantidad de dígitos pares que impares.
function descomponer(num:integer):boolean;
var par,impar,dig:integer;
begin
    par:=0;
    impar:=0;
    while (num<>0)do begin
        dig:= num mod 10;
        if ((dig mod 2) = 0) then
            par:= par + 1
        else
            impar:= impar + 1;
        num:= num div 10;
    end;
    descomponer:= par=impar;
end;

// A) Informar los dos codigos de genero musical con mayor cantidad de visualizaciones en YouTube.
procedure maximo(v:vector; var codMax1, codMax2:integer);
var i, visMax1,visMax2:integer;
begin
    visMax1:=-1;
    for i:=1 to generos do begin
        if (v[i] > visMax1)then begin
            codMax2:= codMax1;
            visMax2:= visMax1;
            codMax1:= i;
            visMax1:= v[i];
        end
        else if (v[i] > visMax2)then begin
            codMax2:= i;
            visMax2:= v[i];
        end;
    end;
end;

procedure recorrido(l:lista; var v:vector);
var
    cant:integer;
    cod1,cod2:integer;
begin
    cant:=0;
    while (l<>nil) do begin
        v[l^.elem.genero]:= v[l^.elem.genero] + l^.elem.visitas; // cargamos vector con las visitas para cada genero (parte para el Inciso A)
        if(l^.elem.genero = 2) and (descomponer(l^.elem.visitas)) then
            cant:= cant + 1; // cantidad de sesiones del Inciso B (solo falta Informar)
        l:= l^.sig;
    end;
    maximo(v,cod1,cod2);
    writeln('Cantidad sesiones reaggeton: ',cant);
    writeln('Codigos con mayor visitas: ',cod1,' y ',cod2); 
end;

// Realizar un módulo que reciba un título de sesión y elimine dicha sesion de la estructura. El título de 
// sesion puede no existir. Invocar el módulo desarrollado en el programa principal con titulo leído por teclado.}
procedure eliminarSesion(var l:lista; titulo:string);
var ant,act:lista;
begin
    ant:=l;
    act:=l;
    while (act <> nil) and (act^.elem.titulo <> titulo) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (act <> nil)then begin
        if(ant = act)then
            l:= l^.sig
        else
            ant^.sig:= act^.sig;
        dispose(act);
    end;
end;

var
    l:lista;
    v:vector;
    tituloEliminar:string[20];
begin
    l:=nil;
    inicializarVec(v);
    cargarLista(l);
    recorrido(l,v);
    readln(tituloEliminar);
    eliminarSesion(l,tituloEliminar);
end.