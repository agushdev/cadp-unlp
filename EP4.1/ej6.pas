{6. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y
otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas
posiciones.}

program a;
const
    dimF=100;
type
    vector=array[1..dimF] of integer;

procedure leerNum(var v:vector; var dimL:integer);
var num:integer;

begin
    writeln('Ingrese un numero (0 para finalizar):');
    readln(num);

    if (num=0) then begin
        dimL:=0;
        writeln('No se ingresaron numeros');
        exit;
    end;

    while(num<>0) do begin
        dimL := dimL + 1;
        v[dimL]:= num;
        writeln('Ingrese otro numero (0 para finalizar):');
        readln(num);
    end;
end;

procedure encontrarMaxMin(const v:vector; var dimL:integer; var maxPos, minPos:integer);
var i,maxNum,minNum:integer;
begin
    maxPos:=0;
    minPos:=0;
    maxNum:=-9999;
    minNum:=9999;

    for i:=1 to dimL do begin     // ENCONTRAR MAXIMO
        if(v[i]>maxNum)then begin
            maxNum:=v[i];
            maxPos:=i;
        end;
    end;

    for i:=1 to dimL do begin     // ENCONTRAR MINIMO
        if(v[i]<minNum)then begin
            minNum:=v[i];
            minPos:=i;
        end;
    end;
end;

procedure intercambiar(var v:vector; var dimL; x,y:integer);
var aux:integer;
begin
    aux:= v[x];
    v[x]:= v[y];
    v[y]:= aux;
end;

procedure imprimirVector(var v:vector; var dimL:integer);
var i:integer;
begin
    writeln('Imprimiendo vector:');
    if (dimL=0) then begin
        writeln('El vector esta vacio');
        exit;
    end;
    for i:=1 to dimL do begin
        write(v[i],' ');
    end;
    writeln;
end;

var
    vec:vector;
    dimL:integer;
    minPos,maxPos:integer;

begin
    dimL:=0;
    leerNum(vec,dimL);
    imprimirVector(vec,dimL);
    encontrarMaxMin(vec,dimL,maxPos,minPos);
    writeln('El elemento maximo ',vec[maxPos],' que se encontraba en la posicion ',maxPos,' fue intercambiado con el elemento minimo ',vec[minPos],' que se encontraba en la posicion ',minPos);
    intercambiar(vec,dimL,maxPos,minPos);
    imprimirVector(vec,dimL);
end.