{Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.}

program a;

const
    dimF=100;

type
    vNum= array[1..dimF] of integer;

procedure imprimirVector (v:vNum; dimL:integer);
var i:integer;
begin
    writeln('Impresion desde primera posicion hasta la ultima:');
    for i:=1 to dimL do begin
        write(v[i],' ');
    end;
    writeln;
end;

var
    vec:vNum;
    dimL:integer;
begin
    dimL:=10;
    vec[1]:=2;
    vec[2]:=4;
    vec[3]:=6;
    vec[4]:=8;
    vec[5]:=10;
    vec[6]:=12;
    vec[7]:=14;
    vec[8]:=16;
    vec[9]:=18;
    vec[10]:=20;

    imprimirVector(vec,dimL);  // Imprime el vector
end.
