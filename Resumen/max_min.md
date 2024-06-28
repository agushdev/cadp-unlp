# **APRENDIENDO A CALCULAR EL MAX Y MIN EN:**
# *Pascal*
<img src='./data/pascal.png' width='350' height='225'>

## MAX: Obviamente lo utilizamos para encontrar el valor maximo.
### Por ejemplo:
````pascal
var
    max,num1,num2:integer;
begin
    max:= -9999 // Inicializamos el maximo siempre en el menor valor posible.
    readln(num1);
    if (num1 > max) then max:= num1; // Si num1 es mayor al max, el max es num1
    readln(num2);
    if (num2 > max) then max:= num2; // Si num2 es mayor al max, el max es num2
end.
````

## MIN: Lo utilizamos para encontrar el valor minimo.
### Por ejemplo:
````pascal
var
    min,num1,num2:integer;
begin
    min:= 9999 // Inicializamos el minimo siempre en el mayor valor posible.
    readln(num1);
    if (num1 < min) then min:= num1; // Si num1 es menor al min, el min es num1
    readln(num2);
    if (num2 < min) then min:= num2; // Si num2 es menor al min, el min es num2
end.
````

### Ejemplo aparte: Sacamos 2 valores maximos con sus nombres
````pascal
 if (numero >= max1) then // Si el valor es mayor al primer maximo
    begin
      max2:= max1; // Guardamos el maximo1 en maximo2
      nombre2:= nombre1; // Guardamos el nombre1 en nombre2
      max1:= numero; // Guardamos el numero en max1
      nombre1:= nombreActual // Guardamos el nombre en max1
    end
  else if (numero >= max2) then // Sino, si el valor es mayor al segundo maximo
    begin
      max2:= numero; // Guardamos el numero en max2
      nombre2:= nombreActual; // Guardamos el nombre en max2
    end; 
````