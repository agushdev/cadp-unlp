---
marp: true
theme: default
class: invert
paginate: true

---

# **APRENDIENDO A USAR LISTAS EN:**
# *Pascal*
![bg right width:600px height:400px](./data/pascal.png)

---



---
# **LISTA**

### Coleccion de nodos, donde cada nodo tiene un elemento y en que direccion de memoria se encuentra el siguiente nodo.

### Cada nodo de la lista se representa con un puntero, que apunta a un dato (elemento de la lista) y a una direccion (donde se ubica el siguiente elemento de la lista).
### Toda lista tiene un elemento inicial.
---

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

---
### **Importante:** antes de acceder a un nodo de lista se tiene que validar que la direccion sea valida.

## **Acceso:**

````pascal
{ Acceso al elemento del nodo }
variableLista^.elem
{ Acceso al siguiente nodo }
variableLista^.sig
````
---
# **Carga**
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
---
# **Metodos de carga**
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
---
# **Insertar ordenado**
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
---
# **Busqueda**
````pascal
function buscar(l: lista; valorBuscado: tipo): boolean;
begin
    while(l <> nil) and (l^.elem.campoValor <> valorBuscado) do
        l := l^.sig
    buscar := l <> nil;
end;
````
---
# **Eliminacion**
````pascal
procedure eliminar(var l: lista; valorAlEliminar: tipo);
var
    act, ant: lista;
begin
    act := l;
    ant := l;
    while (act <> nil) and (act^.elem.campoValor <> valorEliminar) do begin
        ant := act;
        act := act^.sig;
    end;
    if (act <> nil) then begin
        if (act = l) then
            l := act^.sig;
        else
            ant^.sig := act^.sig;
        dispose(act);
    end;
end;
````
---
# **Recorrer lista**
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
---
