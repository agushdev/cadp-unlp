{
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
los cumplen.
}

program a;

type
    rango=1..7;

    sondas=record
        nombre:string[20];
        duracionMision:integer; // cant meses
        costoConstru:integer;
        costoMensual:integer;
        rangoEspectro:rango;
    end;

    lista=^nodo;

    nodo=record
        elem:sondas;
        sig:lista;
    end;

procedure leerSonda(var s:sondas);
begin
    writeln('Ingresar informacion de la sonda: ');
    write('Ingrese nombre de la sonda: '); readln(s.nombre);
    if(s.nombre <> 'GAIA')then begin
        write('Ingrese duracion de la Mision: ');readln(s.duracionMision);
        write('Ingrese costo de la construccion: ');readln(s.costoConstru);
        write('Ingrese costo mensual: ');readln(s.costoMensual);
        writeln('Ingrese rango del espectro electromagnetico (1-7: )');
        writeln('1:radio; 2:microondas; 3:infrarrojo; 4:luz visible; 5:ultravioleta; 6:rayos X; 7:rayos gamma');
        readln(s.rangoEspectro);
    end;
end;

procedure armarNodo(var l:lista; s:sondas);
var 
    nue:lista;
begin
    new(nue);
    nue^.elem:=s;
    nue^.sig:=l;
    l:=nue;
end;

procedure cargarLista(var l:lista);
var
    s:sondas;
begin
    leerSonda(s);
    while(s.nombre <> 'GAIA') do begin
        armarNodo(l,s);
        leerSonda(s);
    end;
end;

function cumpleCriterios(s:sondas):boolean;
begin
    if (s.costoMensual <= s.costoConstru) and (s.rangoEspectro <> 1) then
        cumpleCriterios:=true
    else 
        cumpleCriterios:=false;
end;

//b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
//retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
//los cumplen.

procedure sondasCumplenCriterios(l:lista; var cumple,noCumple:lista);
var
    aux:lista;
begin
    aux:=l;
    while(aux<>nil)do begin
        if cumpleCriterios(aux^.elem) then
            armarNodo(cumple, aux^.elem)
        else
            armarNodo(noCumple, aux^.elem);
        aux:=aux^.sig;
    end;
end;

var
    l, cumple, noCumple: lista;
begin
    l:=nil;
    cumple:=nil;
    noCumple:=nil;

    cargarLista(l);
    sondasCumplenCriterios(l,cumple,noCumple);

    writeln('Sondas que cumplen los criterios H2020:');
    while cumple <> nil do begin
        writeln('Nombre: ', cumple^.elem.nombre);
        cumple := cumple^.sig;
    end;

    writeln('Sondas que no cumplen los criterios H2020:');
    while noCumple <> nil do begin
        writeln('Nombre: ', noCumple^.elem.nombre);
        noCumple := noCumple^.sig;
    end;
end.