
# **LISTA**

### Una lista es una coleccion de nodos, donde cada nodo tiene un elemento y en que direccion de memoria se encuentra el siguiente nodo.

### Cada nodo de la lista se representa con un puntero, que apunta a un dato (elemento de la lista) y a una direccion (donde se ubica el siguiente elemento de la lista).
### Toda lista tiene un elemento inicial.

## **Declaracion:**
````pascal
type
    nombreTipoLista = ^nombreNodo;
    nombreNodo = record
        elem : tipoElemento;
        sig : nombreTipoLista;
    end;
````
### Siempre antes de operar con una variable de lista hay que inicializar en nil, en el caso que la primera operacion sea asignarle el valor de otro puntero no es necesario.

### **Importante:** antes de acceder a un nodo de lista se tiene que validar que la direccion sea valida.

## **Acceso:**

````pascal
{ Acceso al elemento del nodo }
variableLista^.elem
{ Acceso al siguiente nodo }
variableLista^.sig
````

## **Carga**
### Cuando se desconoce la cantidad de elementos, se carga con un while para que verifique una condicion de carga.
````pascal
type
    tElemento = record
        { ... }
    end;
    tLista = ^tNodo;
    tNodo = record

procedure cargarLista(var lista: tLista);
var
    leido: tElemento;
begin
    leerElemento(leido);
    while(leido.campoCorte <> VALOR_CORTE) do begin
        metodoCarga(lista, { otros argumentos, } leido);
        leerElemento(leido);
    end;
end;
````

## **Metodos de carga**
````pascal
{ Agregar al inicio }
procedure agregarAdelante(var l: lista; elemento: tElemento);
var
    nue: lista;
begin
    new(nue);
    nue^.elem := elemento;
    nue^.sig := l;
    l := nue;
end;

{ Agregar al final }
procedure agregarAtras(var pI,pU:lista; elem: tElem);
var
    nue: lista;
begin
    new(nue);
    nue^.elem := elem;
    nue^.sig := nil;
    if (pri <> nil) then
        ult^.sig := nue // si la lista tiene elementos
    else
        pri := nue; // si la lista no tiene elementos
    ult:=nue;
end;
````

## **Insertar ordenado**
````pascal
{ Insertar ordenado }
procedure insertarOrdenar(var l: lista; elemento: tElemento);
var
    nue, act, ant: lista;
begin
    new(nue);
    nue^elem := elemento;
    act := l;
    ant := l;
    while(act <> nil) and (elemento.campoOrden > act^.elem.campoOrden) do begin
        ant := act;
        act := act^.sig;
    end;
    if (act = ant) then
        l := nue
    else
        ant^.sig := nue;
    nue^.sig := act;
end;
````

## **Busqueda Desordenada**
````pascal
function busquedaDesordenada(l: lista; valorBuscado: tipo): boolean;
var ok:boolean;
begin
    ok:= false;
    while(l <> nil) and (ok = false)do begin
        if (l^.elem.campo = valorBuscado) then
            ok:= true
        else
            l:= l^.sig;
    end;
    busquedaDesordenada:= ok;
end;
````
## **Busqueda Ordenada**
````pascal
function busquedaOrdenada(l: lista; valorBuscado: tipo): boolean;
var ok:boolean;
begin
    ok:= false;
    while (l <> nil) and (l^.elem.campo {operacion <> o <,>} valorBuscado) do
        l:= l^.sig;
    if (l <> nil) and (l^.elem.campo = valor)then
        ok:=true;
    busquedaOrdenada:= ok;
end;
````


## **Eliminar sin repeticiones**
````pascal
procedure eliminarSinRepeticiones(var l: lista; valorAEliminar: tipo);
var
    act, ant: lista;
begin
    act := l;
    ant := l;
    while (act <> nil) and (act^.elem.campoValor <> valorAEliminar) do begin
        ant := act;
        act := act^.sig;
    end;
    if (act <> nil) then begin
        if (act = l) then
            l := l^.sig;
        else
            ant^.sig := act^.sig;
        dispose(act);
    end;
end;
````

## **Eliminar con repeticiones**
````pascal
procedure eliminarConRepeticiones(var l: lista; valorAEliminar: tipo);
var
    act, ant: lista;
begin
    act := l;
    ant := l;
    while (act <> nil) do begin
        if(act^.elem.capo <> valorAEliminar) then begin
            ant:= act;
            act:= act^.sig;
        end
        else begin
            if(act = l)then begin
                l:= act^.sig;
                ant:= l;
            end
            else
                ant^.sig:= act^.sig;
            dispose(act);
            act:= ant;
        end;
    end;
end;
````

## **Recorrer lista**
### En este caso imprimirla:
````pascal
Procedure recorrido (l:lista);​
var aux:lista;
begin
    aux:=l;
    while (aux <> NIL) do begin​
        write (aux^.datos.campodato,​ aux^.datos.campodato);​
        aux:= aux^.sig​;
    end;​
end;
````