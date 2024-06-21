{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
e) elementoMaximo: retorna la posición del mayor elemento del vector}

program a;

const
    dimF=100;

type
    vInt=array[1..dimF] of integer;

function elementoMaximo (var v:vInt; dimL:integer):integer;
var i,maxPos,maxValor:integer;
begin
    maxPos:=0;
    maxValor:=-1;
    for i:=1 to dimL do begin
        if(v[i]>maxValor) then begin
            maxValor:=v[i];
            maxPos:=i;
        end;
    end;
    elementoMaximo:=maxPos;
end;

var
    vec:vInt;
    dimL,maxPos:integer;
begin
    maxPos:=-1;
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

    maxPos:= elementoMaximo(vec,dimL);
    writeln('Posicion Elemento Maximo: ',maxPos);
    
end.