{
6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión
(cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y
rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en 
cada rango del espectro electromagnético.
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

    vectorContar = array [1..7] of integer;

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

procedure masCostosa(l:lista; var precioMas:integer; var nombreMas:string);
var
    aux:lista;
begin
    aux:=l;
    while(aux<>nil)do begin
        if((aux^.elem.costoConstru + (aux^.elem.costoMensual * aux^.elem.duracionMision)) > precioMas)then begin
            precioMas:= (aux^.elem.costoConstru + (aux^.elem.costoMensual * aux^.elem.duracionMision));
            nombreMas:= aux^.elem.nombre;
        end;
        aux:=aux^.sig;
    end;
end;

procedure cantSondasCadaRango (l:lista; var cantidades:vectorContar);
var
    aux:lista;
begin
    aux:=l;
    while(aux<>nil)do begin
        cantidades[aux^.elem.rangoEspectro] := cantidades[aux^.elem.rangoEspectro]+1;
        aux:= aux^.sig;
    end;
end;

var
    l:lista;
    precioMas,i:integer;
    nombreMas:string[20];
    cant:vectorContar;
begin
    precioMas:=-9999;
    l:=nil;
    for i:=1 to 7 do
        cant[i]:=0;

    cargarLista(l);

    masCostosa(l,precioMas,nombreMas);
    writeln('La sonda mas costosa es: ',precioMas,' y su nombre: ',nombreMas);

    cantSondasCadaRango(l,cant);
    writeln('Cantidad de sondas por rango del espectro electromagnetico:');
    writeln('Radio: ', cant[1]);
    writeln('Microondas: ', cant[2]);
    writeln('Infrarrojo: ', cant[3]);
    writeln('Luz visible: ', cant[4]);
    writeln('Ultravioleta: ', cant[5]);
    writeln('Rayos X: ', cant[6]);
    writeln('Rayos gamma: ', cant[7]);
end.