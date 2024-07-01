{Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.}

program a;

const
    dimF=100;

type
    vInt=array[1..dimF] of integer;

procedure intercambio (var v:vInt; dimL:integer; x,y:integer);
var
    trade:integer;
begin
    trade:=v[x];
    v[x]:=v[y];
    v[y]:=trade;
    writeln('ahora se intercambiaron: ',v[x],' X ',v[y],' Y ');

end;

var
    vec:vInt;
    dimL,x,y,i:integer;
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
    x := 3; // Posición 3
    y := 7; // Posición 7
    intercambio(vec,dimL,x,y);
    writeln('Vector despues del intercambio:');
    for x := 1 to dimL do
        write(vec[x], ' ');
    writeln;
end.