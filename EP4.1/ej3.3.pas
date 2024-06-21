{Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.}

program a;

const
    dimF=100;

type
    vNum= array[1..dimF] of integer;

procedure imprimirOrdenMedio (v:vNum; dimL:integer);
var i,mitad:integer;
begin
    mitad:= dimL DIV 2;
    writeln('Impresion desde la mitad hacia la primera posicion:');
    for i:=mitad downto 1 do begin
        write(v[i],' ')
    end;
    writeln;
    for i:=(mitad+1) to dimL do begin
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

    imprimirOrdenMedio(vec,dimL); // Imprime el vector del medio para abajo y del medio para arriba
end.
