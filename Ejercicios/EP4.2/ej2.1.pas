{2. Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.}

program a;

const
    dimF=500;
type
    str20=string[20];
    vector=array[1..500] of str20;

procedure cargarVector(var v:vector; var dimL:integer);
var 
    valor:str20;
begin
    readln(valor);
    while (dimL<dimF) and (valor<>'ZZZ') do begin
        dimL:= dimL+1;
        v[dimL]:=valor;
        readln(valor)
    end;
end;

procedure imprimirVector(const v:vector; const dimL:integer);
var
    i:integer;
begin
    writeln('#########');
    writeln('Impriendo vector: ');
    for i:=1 to dimL do begin
        writeln(v[i]);
    end;
end;

var
    vec:vector;
    dimL:integer;
begin
    dimL:=0;
    cargarVector(vec,dimL);
    imprimirVector(vec,dimL);
end.