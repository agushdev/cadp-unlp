{7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.}

program a;
const
    dimF=10;
type
    vector=array[1..dimF] of integer;
    conteoNum=array[0..9] of integer;

procedure leerVector(var v:vector; var dimL:integer); // para llenar el vector
var num:integer;
begin
    write('Ingrese un valor(-1 para finalizar): '); readln(num);

    while(num<>-1) do begin
        dimL:=dimL+1; // incrementa dim logica
        v[dimL]:=num; // agrega num al vector
        write('Ingrese otro valor(-1 para finalizar): '); readln(num); // toma siguiente num
    end;
end;

procedure imprimirVector(const v:vector; dimL:integer); // imprimir vector
var i:integer;
begin
    for i:=1 to dimL do begin // recorrer vector
        write(v[i],' '); // vamos escribiendo cada numero en su posicion
    end;
    writeln;
end;

procedure contarOcurrencias(const v:vector; dimL:integer; var conteo:conteoNum);
var
    i,num,digito:integer;
begin
    for i:=0 to 9 do begin
        conteo[i]:=0;       // inicializar conteo de cada digito a cero
    end;

    for i:=1 to dimL do begin // recorrer vector para contar los digitos
        num:= v[i]; // numero del vector

        if (num<0) then begin   // si es negativo
            num:=-num;          // convertir a positivo para extraer los digitos
        end;

        while(num>0)do begin
            digito:= num mod 10; // extraer ultimo digito
            conteo[digito]:= conteo[digito]+1; // incrementar el conteo del digito extraido
            num := num div 10; // elimina el ultimo digito
        end;
    end;
end;

procedure imprimirConteo(const conteo:conteoNum);
var i:integer;
begin
    writeln('Ocurrencias de cada dígito:');
    for i := 0 to 9 do
    begin
        writeln('Digito ', i, ': ', conteo[i]); // Imprimir el conteo de cada dígito
    end;
end;

var
    vec:vector;
    dimL,num:integer;
    conteo:conteoNum;

begin
    dimL:=0;
    leerVector(vec,dimL);
    imprimirVector(vec,dimL);

    contarOcurrencias(vec, dimL, conteo); // Contar ocurrencias de cada dígito
    imprimirConteo(conteo); // Imprimir el conteo de cada dígito
end.