{5. Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.}

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

function maxElemento(const v:vector; var dimL:integer): integer;
var i,maxPos,maxNum:integer;
begin
    maxPos:=0;
    maxNum:=-9999;
    for i:=1 to dimL do begin
        if(v[i]>maxNum)then begin
            maxNum:=v[i];
            maxPos:=i;
        end;
    end;
    maxElemento:=maxPos;
end;

function minElemento(const v:vector; var dimL:integer): integer;
var i,minPos,minNum:integer;
begin
    minPos:=0;
    minNum:=9999;
    for i:=1 to dimL do begin
        if(v[i]<minNum)then begin
            minNum:=v[i];
            minPos:=i;
        end;
    end;
    minElemento:=minPos;
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
    minPos:= minElemento(vec,dimL);
    maxPos:= maxElemento(vec,dimL);
    writeln('El elemento maximo ',vec[maxPos],' que se encontraba en la posicion ',maxPos,' fue intercambiado con el elemento minimo ',vec[minPos],' que se encontraba en la posicion ',minPos);
    intercambiar(vec,dimL,maxPos,minPos);
    imprimirVector(vec,dimL);
end.