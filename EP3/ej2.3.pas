{El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los meses de verano 
(enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.}

program a;

type

    rangoDia=1..30;
    rangoMes=1..12;

    fecha = record
        dia:rangoDia;
        mes:rangoMes;
        anio:integer;
    end;

procedure leerFecha(var f:fecha); 
begin
    write('Ingresar el dia (1-31): '); readln(f.dia);
    write('Ingresar el mes (1-12): '); readln(f.mes);
    write('Ingresar el anio: '); readln(f.anio);
end;

function esVerano(f:fecha):boolean;
begin
    esVerano:= (f.mes=1) or (f.mes=2) or (f.mes=3);
end;

function esPrimeros10Dias(f: fecha): boolean;
begin
  esPrimeros10Dias := (f.dia >= 1) and (f.dia <= 10);
end;

var
    f: fecha;
    casamientosVerano,casamientosPrimeros10Dias:integer;
begin
    casamientosVerano:=0;
    casamientosPrimeros10Dias:=0;
    leerFecha(f);
    while(f.anio<>2020) do begin
        if esVerano(f) then
            casamientosVerano := casamientosVerano + 1;
        if esPrimeros10Dias(f) then
            casamientosPrimeros10Dias := casamientosPrimeros10Dias + 1;
        leerFecha(f);
    end;
    writeln('Cantidad de casamientos en verano (enero, febrero, marzo): ', casamientosVerano);
    writeln('Cantidad de casamientos en los primeros 10 dias de cada mes: ', casamientosPrimeros10Dias);
end.