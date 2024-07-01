{Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.}

program a;

const
    dimF=100;

type
    vNum= array[1..dimF] of integer;

procedure imprimirOrdenDescendente (v:vNum; dimL:integer);
var i:integer;
begin
    writeln('Impresion desde la ultima posicion hasta la primera:');
    for i:=dimL downto 1 do begin
        write(v[i],' ')
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

    imprimirOrdenDescendente(vec,dimL) // Imprime el vector orden descendente
end.
