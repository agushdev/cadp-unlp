{2. Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
c. Lea un nombre y lo inserte en la posición 4 del vector.}

program a;

const
    dimF=500;
type
    str20=string[20];
    vector=array[1..500] of str20;

procedure cargarVector(var v:vector; var dimL:integer);
var 
    valor:str20;
begin
    readln(valor);
    while (dimL<dimF) and (valor<>'ZZZ') do begin
        dimL:= dimL+1;
        v[dimL]:=valor;
        readln(valor)
    end;
end;

procedure imprimirVector(const v:vector; const dimL:integer);
var
    i:integer;
begin
    writeln('#########');
    writeln('Impriendo vector: ');
    for i:=1 to dimL do begin
        writeln(v[i]);
    end;
end;

procedure borrarElemento(var v:vector; var dimL:integer; var nombre:str20);
var
    i,pos:integer;
    encontro:boolean;
begin
    encontro:=false;
    pos:=1;
    while (encontro=false) and (pos<=dimL) do begin
        if (v[pos]=nombre) then begin
            encontro:=true;
            v[pos]:='';
            dimL:=dimL-1;
        end
        else pos:=pos+1;
    end;
    for i:=pos to (dimL) do begin
        v[i]:=v[i+1];
    end;

    if (encontro = true) then
        writeln('Se elimino')
    else
        writeln('No se ha encontrado');
end;

procedure insertarElemento(var v:vector; var dimL:integer; var nombre:str20; var pos:integer);
var 
    i:integer;
begin
    if ((dimL)<= dimF) and (pos>=1) and (pos<=dimL+1) then begin
        for i:=dimL downto pos do 
            v[i+1]:= v[i];
        v[pos]:=nombre;
        dimL:=dimL+1;
    end
    else   writeln('No se puede insertar el nombre. Posicion fuera de rango o vector lleno.');
end;

var
    vec:vector;
    dimL,pos:integer;
    nombreAlumnoBorrar:str20;
    nombreAlumnoInsertar:str20;
begin
    dimL:=0;
    pos:=4;
    cargarVector(vec,dimL);
    imprimirVector(vec,dimL);
    write('Ingrese nombre de alumno a borrar: '); readln(nombreAlumnoBorrar);
    borrarElemento(vec,dimL,nombreAlumnoBorrar);
    imprimirVector(vec,dimL);
    write('Ingrese nombre de alumno a insertar: '); readln(nombreAlumnoInsertar);
    insertarElemento(vec,dimL,nombreAlumnoInsertar,pos);
    imprimirVector(vec,dimL);
end.