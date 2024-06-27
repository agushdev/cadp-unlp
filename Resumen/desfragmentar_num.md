# **APRENDIENDO A DESFRAGMENTAR UN NUMERO EN:**
# *Pascal*
![bg right width:600px height:400px](./data/pascal.png)

## Desfragmentar Numero: Si necesitamos desfragmentar un numero podemos hacerlo de la siguiente manera:
### Por ej Desfragmentar mi legajo y contar cuantos 0 tiene.
````pascal
var num,dig,cantCero:integer;
begin
    cantCero:=0; // Inicializo cantCero en 0
    num:= 19704 // Mi legajo
    while(num<>0)do begin
        dig:= num mod 10; // Tomo el ultimo digito
        num:= num div 10; // Elimino el ultimo digito
        if (dig=0) then cantCero:= cantCero + 1; // Si el digito es 0, incremento la variable contadora de ceros.
    end;
end.
````

### Tambien pueden haber ejemplos de descomoponer y contar los numeros pares/impares.
### Simplemente hacemos un if((dig mod 2)= 0) para contar par y if((dig mod 2)<>0) para contar impar