{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
e) elementoMaximo: retorna la posición del mayor elemento del vector}

program a;

const
    dimF=100;

type
    vInt=array[1..dimF] of integer;

function elementoMinimo (var v:vInt; dimL:integer):integer;
var i,minPos,minValor:integer;
begin
    minPos:=0;
    minValor:=9999;
    for i:=1 to dimL do begin
        if(v[i]<minValor) then begin
            minValor:=v[i];
            minPos:=i;
        end;
    end;
    elementoMinimo:=minPos;
end;

var
    vec:vInt;
    dimL,minPos:integer;
begin
    minPos:=9999;
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

    minPos:= elementoMinimo(vec,dimL);
    writeln('Posicion Elemento Minimo: ',minPos);
    
end.