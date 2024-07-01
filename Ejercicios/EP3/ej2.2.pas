{El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).}

program a;

type

    rangoDia=1..30;
    rangoMes=1..12;

    fecha = record
        dia:rangoDia;
        mes:rangoMes;
        anio:integer;
    end;

procedure leerFecha(var f:fecha); begin
    write('Ingresar el dia (1-31): '); readln(f.dia);
    write('Ingresar el mes (1-12): '); readln(f.mes);
    write('Ingresar el anio: '); readln(f.anio);
end;

var
    f: fecha;
begin
    leerFecha(f);
    writeln('Fecha ingresada: ', f.dia, '/', f.mes, '/', f.anio);
end.