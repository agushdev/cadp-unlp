{Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la posición
X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere que,
dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.}

program a;

const
    dimF=100;

type
    vNum= array[1..dimF] of integer;

procedure imprimirXY (v:vNum; x,y,dimL:integer);
var i:integer;
begin
    write('Ingrese valor para la posicion X: '); readln(x);
    write('Ingrese valor para la posicion Y: '); readln(y);
    if(x<=y) and (x<dimL) and (y<dimL) then begin
        for i:=x to y do begin
            write(v[i],' ');
        end;
        writeln;
    end
    else if (x>=y) and (x<dimL) and (y<dimL) then begin
        for i:=x downto y do begin
            write(v[i],' ');
        end;
        writeln;
    end
    else if(x=y) then begin
        write(v[x]);
    end;
end;

var
    x,y:integer;
    vec:vNum;
    dimL:integer;
begin
    x:=0;
    y:=0;
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

    imprimirXY(vec,x,y,dimL);
end.
