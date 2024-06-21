{d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero llegarán
todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se los atenderá de a
uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.}

program a;

type
    cliente = record
        dni: integer;
        numero: integer;
    end;

    lista = ^nodo;
    nodo = record
        elem: cliente;
        sig: lista;
    end;

procedure agregarAtras(var pI, pU: lista; c: cliente);
var
    aux: lista;
begin
    new(aux);
    aux^.elem := c;
    aux^.sig := nil;

    if pI = nil then begin
        pI := aux;
        pU := aux;
    end else begin
        pU^.sig := aux;
        pU := aux;
    end;
end;

procedure recibirCliente(var pI, pU: lista; dni: integer);
var
    c: cliente;
    ultNum: integer;
begin
    if pU = nil then
        ultNum := 0
    else
        ultNum := pU^.elem.numero;
    c.dni := dni;
    c.numero := ultNum + 1;
    agregarAtras(pI, pU, c);
end;

procedure atenderCliente(var pI, pU: lista; var num, dni: integer);
var
    aux: lista;
begin
    if pI = nil then begin
        writeln('No hay clientes en lista de espera');
        num := -1;
        dni := -1;
    end else begin
        aux := pI;
        num := pI^.elem.numero;
        dni := pI^.elem.dni;
        pI := pI^.sig;
        if pI = nil then
            pU := nil;
        dispose(aux);
    end;
end;

procedure imprimirLista(l: lista);
begin
    while l <> nil do begin
        writeln('DNI: ', l^.elem.dni, ' Numero: ', l^.elem.numero);
        l := l^.sig;
    end;
end;

procedure ingresarCliente(var pI,pU:lista);
var
    dni:integer;
begin
    writeln('Ingresar DNI de los clientes (0 para terminar):');
    readln(dni);
    while(dni<>0)do begin
        recibirCliente(pI,pU,dni);
        readln(dni);
    end;
end;

procedure atenderClientes(var pI,pU: lista);
var
    num,dni:integer;
begin
    writeln('Atendiendo clientes');
    while(pI<>nil) do begin
        atenderCliente(pI,pU,num,dni);
        if (num<>-1)then
            writeln('Cliente atendido: DNI ', dni, ' Numero ', num);
    end;
    writeln('No hay mas clientes en lista de espera.');
end;

var
    pI, pU: lista;
    num, dni: integer;
begin
    pI := nil;
    pU := nil;
    
    writeln('Ingresando clientes: ');
    ingresarCliente(pI,pU);

    writeln('Lista de espera:');
    imprimirLista(pI);
    
    atenderClientes(pI,pU);

    writeln('Todos los clientes fueron atendidos.');
end.