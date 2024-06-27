# **APRENDIENDO A USAR CORTE DE CONTROL EN:**
# *Pascal*
![bg right width:600px height:400px](./data/pascal.png)

# **Corte de control**

### Un corte de control es una "tecnica" para procesar y agrupar datos que esten ordenados por algun criterio(clave de control).

### Puede ser ser un criterio de corte o de filtracion.

### Por ejemplo: Supongamos que el enunciado es leer productos hasta que lea el producto "tomate" (este puede o no ser procesado, depende del enunciado)

* ### Si el elemento **debe** ser procesado utilizamos un repeat until, ya que primero ejecuta y despues evalua si cumple la condicion.
* ### Si el elemento **no debe** ser procesado utilizamos un while, ya que primero evalua si cumple la condicion y despues ejecuta.

### En este caso hagamos que el producto "tomate" no se procese, lo tenemos como un valor de corte.

````pas
procedure leerInfo(var info:registro);
begin
    readln(info.producto);
    if (producto <> 'tomate') then begin
        readln(info.precio);
        readln(info.peso);
    end;
end;

// Bloque principal
var info:registro;
begin
    leerInfo(info);
    while (info.producto <> 'tomate') do begin
        writeln(info.producto,' ', info.precio,' ', info.peso);
        leerInfo(info);
    end;
end.
````