{Dado el siguiente programa, complete las líneas indicadas, considerando que:
a) El módulo cargarVector debe leer números reales y almacenarlos en el vector que se pasa como
parámetro. Al finalizar, debe retornar el vector y su dimensión lógica. La lectura finaliza cuando se ingresa
el valor 0 (que no debe procesarse) o cuando el vector está completo.
b) El módulo modificarVectorySumar debe devolver el vector con todos sus elementos incrementados con
el valor n y también debe devolver la suma de todos los elementos del vector.}

program Vectores;

const
    cant_datos = 150;

type
    vdatos = array[1..cant_datos] of real;

procedure cargarVector(var v:vdatos; var dimL : integer);
var
    valor:real;
begin
    write('Ingrese valor (0 finaliza): '); readln(valor);
    while (valor<>0) and (dimL < cant_datos) do begin // mientras que el valor sea distinto a 0 y la dimension logica sea menor a la cantidad de datos:
        dimL:= dimL+1; // pasar de posicion - incrementar dimension logica
        v[dimL]:=valor; // darle un valor a la posicion actual que seria la "dimensionLogica"
        write('Ingrese otro valor (0 finaliza): '); readln(valor); // pasar a siguiente valor
    end;
end;

procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var
    i:integer;
begin
    for i:=1 to dimL do begin
        v[i] := v[i] + n; // Incrementa cada elemento
        suma:= suma + v[i]; // Suma el total
    end;
end;

{ programa principal }
var
    datos : vdatos;
    dim : integer;
    num, sumaTotal : real;
begin
    dim := 0;
    sumaTotal := 0;
    cargarVector(datos,dim); // carga el vector dandole valores a cada posicion
    writeln('Ingrese un valor a sumar');
    readln(num); // valor a sumar
    modificarVectorySumar(datos,dim,num,sumaTotal); // modifica el vector y suma
    writeln('La suma de los valores es: ', sumaTotal:0:2);
    writeln('Se procesaron: ',dim, ' numeros');
end.