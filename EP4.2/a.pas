procedure eliminar(var dimL:integer; var v:vector; pos:integer; var pude:boolean)
var i:integer;
begin
    pude:=false;
    if ((pos>=1) and (pos<=dimL)) then begin
        for i:=pos to (dimL-1) do
            v[i]:=v[i+1];
        pude:=true;
        dimL:= dimL-1;
    end;
end;
