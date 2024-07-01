{Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.}

program a;

type
    str20=string[20];
    centro=record
        abreviacionNombre:str20;
        universidad:str20;
        cantInvestigadores:integer;
        cantBecarios:integer;
    end;

    universidadInfo = record
        nombre: str20;
        cantCentros: integer;
    end;

procedure leerInfo(var c:centro);
begin
    write('Ingresar abreviatura del centro: '); readln(c.abreviacionNombre);
    write('Ingresar universidad del centro: '); readln(c.universidad);
    write('Ingresar cantidad de investigadores del centro: '); readln(c.cantInvestigadores);
    write('Ingresar cantidad de becarios del centro: '); readln(c.cantBecarios);
end;

procedure actualizarMaximo(var c:centro; var maxInves:integer; var maxUni:str20);
begin
    if(maxInves< c.cantInvestigadores)then begin
        maxInves:= c.cantInvestigadores;
        maxUni:=c.universidad;
    end;
end;

procedure actualizarMinimos(var c:centro; var minBeca1,minBeca2:integer; minCentro1,minCentro2:str20);
begin
    if(c.cantBecarios < minBeca1) then begin
        minBeca2:=minBeca1;
        minCentro2:=minCentro1;
        minBeca1:=c.cantBecarios;
        minCentro1:=c.abreviacionNombre;
    end else if (c.cantBecarios < minBeca2) then begin
        minBeca2:=c.cantBecarios;
        minCentro2:=c.abreviacionNombre;
    end;
end;

procedure imprimirResultados(cantCentros: integer; maxUni: str20; minCentro1, minCentro2: str20; maxInves: integer);
begin
    writeln('Cantidad total de centros:', cantCentros);
    writeln('Universidad con mayor cantidad de investigadores: ', maxUni, ' con ', maxInves, ' investigadores.');
    writeln('Los dos centros con menor cantidad de becarios: ', minCentro1, ' y ', minCentro2);
end;

var
    cen:centro;
    cantCentros:integer;
    maxInvestigadores:integer;
    maxUniversidad:str20;
    minBeca1,minBeca2:integer;
    minCentro1,minCentro2:str20;
begin
    minBeca1 := 9999;
    minBeca2 := 9999;
    minCentro1:='';
    minCentro2:='';
    cantCentros:=0;
    maxUniversidad:='';
    maxInvestigadores:=0;

    leerInfo(cen);
    while (cen.cantInvestigadores > 0) do begin
        cantCentros:= cantCentros+1;
        actualizarMaximo(cen,maxInvestigadores,maxUniversidad);
        actualizarMinimos(cen,minBeca1,minBeca2,minCentro1,minCentro2);
        leerInfo(cen);
    end;

    imprimirResultados(cantCentros, maxUniversidad, minCentro1, minCentro2, maxInvestigadores);
end.