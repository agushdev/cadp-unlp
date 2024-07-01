{1. Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura
finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.}

program a;

type
    genero=1..5;
    str20=string[20];

    persona=record
        dni:integer;
        apellido:str20;
        nombre:str20;
        edad:integer;
        codigo:genero;
    end;

    lista=^nodo;

    nodo=record
        elem:persona;
        sig:lista;
    end;

    vectorContador=array[genero] of integer;

// procedimiento para leer persona, corta cuando el dni es 33555444
procedure leerPersona(var p:persona);
begin
    with p do begin
        write('DNI: '); readln(dni);
        write('APELLIDO: '); readln(apellido);
        write('NOMBRE: '); readln(nombre);
        write('EDAD: '); readln(edad);
        write('CODIGO (1: Drama, 2: Romantico, 3: Accion, 4: Suspenso, 5: Terror): '); readln(codigo);
    end;
end;


// procedimiento para agregar 
procedure agregarAdelante(var l:lista; p:persona);
var aux:lista;
begin
    new(aux);
    aux^.elem:= p;
    aux^.sig:= l;
    l:=aux;
end;

// procedimiento para cargarlista, corta con el dni 33555444 y se procesa (repeat until)
procedure cargarLista(var l:lista);
var p:persona;
begin
    leerPersona(p);
    repeat
        agregarAdelante(l,p);
        leerPersona(p);
    until (p.dni <> 3);
end;

//a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
// procedimiento (l:lista) y variable con par,impar,digito:integer;
procedure cantPersonasDigPar(dni:integer; var cantPares:integer);
var par,impar,dig:integer;
begin
    par:=0;
    impar:=0;
    while (dni <> 0) do begin
        dig:= dni mod 10;
        if((dig mod 2)=0) then
            par:= par+1
        else
            impar:= impar+1;
        dni:= dni div 10;
    end;
    if (impar<par) then
        cantPares:= cantPares+1;
end;

// b. Informar los dos códigos de género más elegidos.
// utilizar vectorContador de los 5 generos. obviamente primero inicializamos vector en 0.
procedure inicializarVector(var v:vectorContador);
var i:integer;
begin
    for i:=1 to 5 do
        v[i]:=0;
end;

// agarramos los 2 genMax
procedure code2GenMax(v:vectorContador; var codMax1,codMax2:genero; var valorMax1,valorMax2:integer);
var i:integer;
begin
    for i:=1 to 5 do begin
        if(valorMax1 < v[i]) then begin
            valorMax2:= valorMax1;
            codMax2:= codMax1;
            valorMax1:= v[i];
            codMax1:= i;
        end
        else if(valorMax2 < v[i]) then begin
            valorMax2:= v[i];
            codMax2:= i;
        end;
    end;
    writeln('Cantidad de personas con más dígitos pares que impares en su DNI: ', cantPares);
    writeln('Los dos códigos de género más elegidos son: ', codMax1, ' y ', codMax2);
end;

//c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
//existir. Invocar dicho módulo en el programa principal.}

var
    lis:lista;
    vec:vectorContador;
    cantPares:integer;
    codMax1,codMax2:genero;
    valorMax1,valorMax2:integer;
    tipo:genero;
begin
    cantPares:=0;
    valorMax1:=-9999;
    valorMax2:=-9999;
    inicializarVector(vec);
    lis:=nil;
    cargarLista(lis);
    while (lis<>nil) do begin
        tipo:=lis^.elem.codigo;
        cantPersonasDigPar(lis^.elem.dni,cantPares);
        vec[tipo]:= vec[tipo]+1;
        lis:= lis^.sig;
    end;
    code2GenMax(vec,codMax1,codMax2,valorMax1,valorMax2);
    writeln('Cantidad de personas con más dígitos pares que impares en su DNI: ', cantPares);
    writeln('Los dos códigos de género más elegidos son: ', codMax1, ' y ', codMax2);
end.