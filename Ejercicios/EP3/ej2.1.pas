{El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.}

program a;

type

    rangoDia=1..30;
    rangoMes=1..12;

    fecha = record;
        dia:rangoDia;
        mes:rangoMes;
        anio:integer;
    end;
var

begin
end.