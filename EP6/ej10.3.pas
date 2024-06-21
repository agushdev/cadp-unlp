{c. Implementar el módulo AtenderCliente, que recibe como parámetro 
la lista de clientes en espera, y retorna
el número y DNI del cliente a ser atendido y la lista actualizada. 
El cliente atendido debe eliminarse de la lista de espera.}

{
10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un
número (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado por su
número, en cuyo caso sale de la lista de espera. Se pide:
}

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

var
    pI, pU: lista;
    num, dni: integer;
begin
    pI := nil;
    pU := nil;
    
    writeln('Ingresando clientes: ');
    recibirCliente(pI, pU, 1234);
    recibirCliente(pI, pU, 2341);
    recibirCliente(pI, pU, 4523);

    writeln('Lista de espera:');
    imprimirLista(pI);

    writeln('Atendiendo cliente: ');
    atenderCliente(pI, pU, num, dni);
    if (num <> -1) and (dni <> -1) then
        writeln('Cliente atendido: DNI: ', dni, ' Numero: ', num);
    
    writeln('Lista de espera:');
    imprimirLista(pI);

    writeln('Atendiendo cliente: ');
    atenderCliente(pI, pU, num, dni);
    if (num <> -1) and (dni <> -1) then
        writeln('Cliente atendido: DNI: ', dni, ' Numero: ', num);

    writeln('Lista de espera:');
    imprimirLista(pI);
end.