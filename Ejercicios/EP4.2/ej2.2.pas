

{2. Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.}

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

procedure borrarElemento(var v:vector; var dimL:integer; nombre:str20);
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

var
    vec:vector;
    dimL:integer;
    nombreAlumno:str20;
begin
    dimL:=0;
    cargarVector(vec,dimL);
    imprimirVector(vec,dimL);
    write('Ingrese nombre de alumno a borrar: '); readln(nombreAlumno);
    borrarElemento(vec,dimL,nombreAlumno);
    imprimirVector(vec,dimL);
end.