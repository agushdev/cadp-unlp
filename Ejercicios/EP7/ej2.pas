{Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza
contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente
con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.
}

program a;
type
    rango=1..6;
    
    cliente=record
        codigoCliente:integer;
        dni:integer;
        apellido:string[20];
        nombre:string[20];
        codigoPoliza:integer;
        montoBasico:integer;
    end;

    lista=^nodo;
    nodo=record
        elem:cliente;
        sig:lista;
    end;

    vectorMonto=array[rango] of real;

procedure leerCliente(var c:cliente);

procedure agregarAdelante(var l:lista; c:cliente);

procedure cargarLista(var l:lista);
var c:cliente;

procedure informarA(l:lista; vM:vectorMonto);
var
    montoTotal:real;
begin
    writeLn('DNI:', l^.elem.dni);
    writeLn('Apellido: ', l^.elem.apellido);
    writeLn('Nombre: ',l^.elem.nombre);
    montoTotal:=vM[l^.elem.codigoPoliza] + l^.elem.montoBasico;
    writeLn('Monto Total',montoTotal);
end;

procedure informarB(l:lista);
var
    dig:integer;
    contNueve:integer;
    cumple:boolean;
begin
    cumple:=false;
    contNueve:=0;
    while (l^.elem.dni <> 0) and (cumple <> true) do begin
        dig:= l^.elem.dni MOD 10;
        if(dig = 9) then
            contNueve:= contNueve+1;
        if(contNueve=2)then
            cumple:=true;
        dig:= dig div 10;
    end;
end;

procedure recorrerInformar(l:lista; vM:vectorMonto);
begin
    while(l<>nil) do begin
        informarA(l,vM);
        informarB(l);
        l:=l^.sig;
    end;
end;

procedure eliminarCodigoCliente(var l:lista; codigo:integer);
var
    act,ant:lista;
begin
    act:= l;
    ant:= l;
    while(act<>nil) and (act^.elem.codigoCliente <> codigo) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (act <> nil) then begin
        if(act = l) then
            l:= act^.sig;
        else
            ant^.sig:= act^.sig;
        dispose(act);
    end;
end;

var
    l:lista;
    vM:vectorMonto;
    codigo:integer;
begin
    l:=nil
    // cargarVectorMontos(vM);
    // cargarLista(l);
    recorrerInformar(l,vM);
    readln(codigo);
    eliminarCodigoCliente(l,codigo);
end;


