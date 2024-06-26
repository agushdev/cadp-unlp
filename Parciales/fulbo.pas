{Una revista deportiva dispone de información de los jugadores de fútbol participantes de la liga profesional 2022. 
De cada jugador se conoce código de jugador, apellido y nombres, codigo de equipo (1.28), año de nacimiento y la calificación obtenida para cada una de las 27 fechas del torneo ya finalizado. 
La calificacion es numérica de 0 a 10, donde el valor 0 significa que el jugador no ha participado de la fecha.

Se solicita:

a. Informar para cada equipo la cantidad de jugadores mayores a 35 años.

b. Informar los códigos de los 2 jugadores con mejor calificación promedio en los partidos en los que participo. Solo deben considerarse los jugadores que participaron en más de 14 fechas.

c. Implementar e invocar a un módulo que genere una lista con los jugadores cuyo código 
posee exactamente 3 digitos impares y haya nacido entre 1983 y 1990. La lista debe estar ordenada por código de jugador.}

program futbol;

const
    equipos= 28;
    fechas= 27;
type
    rangoEquipo= 1..equipos;
    rangoFecha= 1..fechas;

    vectorCalificacion= array[rangoFecha] of integer;

    jugadores= record
        codJugador: integer;
        nombreApellido: string[40];
        codEquipo: rangoEquipo;
        anioNacimiento: integer;
        calificacion: vectorCalificacion;
    end;
    
    lista= ^nodo;
    nodo= record
        elem:jugadores;
        sig:lista;
    end;

    vectorEquipo= array[rangoEquipo] of integer;

procedure cargarLista(var l:lista); // Se dispone

procedure inicializarVector(var v:vectorEquipo);
var i:integer;
begin
    for i:=1 to equipos do v[i]:=0;
end;

function cantidadFechasJugadas(v:vectorCalificacion): integer;
var
    i,cant:integer;
begin
    cant:= 0;
    for i:=1 to fechas do begin
        if (v[i] > 0) then cant:= cant + 1;
    end;
    cantidadFechasJugadas:= cant;
end;

function promedioCalificacion(v:vectorCalificacion): real;
var 
    i,suma:integer;
    promedio:real;
begin
    suma:= 0;
    for i:=1 to fechas do begin
        suma:= suma + v[i];
    end;
    promedio:= suma / cantidadFechasJugadas(v);

    promedioCalificacion:= promedio;
end;

procedure maximo(var max1,max2:integer; var prom1,prom2:real; jug:integer; prom:real);
begin
    if (prom>prom1) then begin
        prom2:= prom1;
        max2:= max1;
        prom1:= prom;
        max1:= jug;
    end else if (prom>prom2) then begin
        prom2:= prom;
        max2:= jug;
    end;
end;

procedure recorrido(l:lista; var v:vectorEquipo; var max1,max2:integer);
var
    calificacion: vectorCalificacion;
    prom1,prom2,prom:real;
begin
    prom1:= -1;
    prom2:= -1;
    while(l<>nil)do begin
        if ((2022 - l^.elem.anioNacimiento) > 35) then v[l^.elem.codEquipo]:= v[l^.elem.codEquipo] + 1;

        calificacion:= l^.elem.calificacion;
        prom:= promedioCalificacion(calificacion);
        if (cantidadFechasJugadas(calificacion) > 14) then
            maximo(max1,max2,prom1,prom2,l^.elem.codJugador,prom);
        l:= l^.sig;
    end;
end;

function cumpleImpares(num:integer): boolean;
var
    dig,cant:integer;
begin
    cant:= 0;
    while(num <> 0)do begin
        dig:= num mod 10;
        num:= num div 10;
        if((dig mod 2) = 1) then cant:= cant + 1;
    end;
    cumpleImpares:= cant=3;
end;

procedure insertarOrdenado(var l2:lista; j: jugadores);
var nue,act,ant:lista;
begin
    new(nue); nue^.elem:=j;
    act:=l2; ant:=l2;
    while(act<>nil) and (j.codJugador > act^.elem.codJugador)do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (act = ant) then
        l:= nue
    else
        ant^.sig:= nue;
    nue^.sig:= act;
end;

procedure incisoC(l:lista; var l2:lista);
begin
    while(l<>nil)do begin
        if (cumpleImpares(l^.elem.codJugador) and (l^.elem.anioNacimiento >= 1983) and (l^.elem.anioNacimiento <= 1990)) then 
            insertarOrdenado(l2,l^.elem);
        l:= l^.sig;
    end;
end;

procedure incisoA(v:vectorEquipo);
var i: rangoEquipo;
begin
    for i:=1 to equipos do writeln('Equipo: ',i,' tiene ',v[i],' jugadores mayores a 35 anios');
end;

var
    l,l2: lista;
    v: vectorEquipo;
    max1,max2: integer;
begin
    l:= nil;
    l2:= nil;
    cargarLista(l); // Se dispone
    inicializarVector(v);
    recorrido(l,v,max1,max2);
    incisoC(l,l2);
    incisoA(v);
    writeln('Jugadores con mejor calificacion promedio. 1er Lugar:',max1,' 2do Lugar: ',max2);
end.