{b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.}

program a;

const
    dimF=3;
type
    vector=array[1..dimF] of integer;

procedure cargarVector(var v:vector; var dimL:integer);
var 
    num:integer;
begin
    readln(num);
    while (num<>-1) and (dimL<dimF) do begin
        dimL:= dimL+1;
        v[dimL]:=num;
        readln(num);
    end;
end;

function busqueda(var v:vector; var dimL:integer; var n:integer): boolean;
var 
    pri,ult,medio:integer;
    ok:boolean;
begin
    ok:=false;
    pri:=1; ult:= dimL; medio:=(pri+ult)div 2;
    while(pri<=ult) and (n<>v[medio])do begin
        if(n<v[medio]) then ult:= medio-1
        else pri:=medio+1;
        medio:= (pri+ult)div 2;
    end;
    if (pri<=ult) and (n=v[medio]) then ok:=true;
    busqueda:=ok;
end;

var
    dimL,num:integer;
    vec:vector;
begin
    dimL:=0;
    cargarVector(vec,dimL);
    readln(num);
    if (busqueda(vec,dimL,num)=true)then writeln('Se encontro')
    else writeln('No se encontro');
end.