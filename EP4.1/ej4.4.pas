{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
d) promedio: devuelve el valor promedio de los elementos del vector.}

program a;

const
    dimF=100;

type
    vInt=array[1..dimF] of integer;

function sumaVector (var v:vInt; dimL:integer): integer;
var
    i,suma:integer;
begin
    suma:=0;
    for i:=1 to dimL do begin
        suma:= suma + v[i];
    end;
    sumaVector:= suma;
end;

function promedio (var v:vInt; dimL:integer): real;
var
    suma:integer;
begin
    suma:=sumaVector(v,dimL);
    promedio:=suma/dimL;
end;

var
    vec:vInt;
    dimL:integer;
    resultado:real;
begin
    dimL := 10;
    vec[1] := 10;
    vec[2] := 20;
    vec[3] := 30;
    vec[4] := 40;
    vec[5] := 50;
    vec[6] := 60;
    vec[7] := 70;
    vec[8] := 80;
    vec[9] := 90;
    vec[10] := 100;

    resultado:=promedio(vec,dimL);

    writeln('Promedio total: ',resultado:0:2);
    
end.