{
7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se
han determinado los siguientes criterios:
- sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas.
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar
un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los
nuevos criterios H2020.
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

procedure sondasCumplenCriterios(l:lista);
var
    aux:lista;
begin
    aux:=l;
    writeln('Sondas que cumplen los criterios:');
    while (aux<>nil)do begin
        if (cumpleCriterios(aux^.elem)) then
            writeln('Nombre: ', aux^.elem.nombre);
        aux:= aux^.sig;
    end;
end;

var
    l:lista;
begin
    l:=nil;
    cargarLista(l);
    sondasCumplenCriterios(l);
end.