{Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.}

program a;

const
    dimF=100;

type
    vInt=array[1..dimF] of integer;

function posicion (var v:vInt; dimL,x:integer):integer;
var
    i:integer;
begin
    posicion:=-1;
    for i:=1 to dimL do begin
        if (v[i]=x) then begin
            posicion:=i;
            break;
        end;
    end;
end;

var
    vec:vInt;
    dimL,pos,numero:integer;
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

    write('Ingrese un numero para buscar en el vector: ');
    readln(numero);

    pos := posicion(vec, dimL, numero);
    if pos = -1 then
        writeln('El numero no se encontro en el vector.')
    else
        writeln('El numero se encuentra en la posicion: ', pos);
end.