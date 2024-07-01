{Encontrar los 6 errores que existen en el siguiente programa. Utilizar los comentarios entre llaves como guía,
indicar en qué línea se encuentra cada error y en qué consiste: }
{program ejercicio5;
 // suma los números entre a y b, y retorna el resultado en c 
    procedure sumar(a, b, c : integer)
    var
        suma,i : integer;
    begin
        for i := a to b do
            suma := suma + i;
            c := c + suma;
    end;
    var
        result : integer;
    begin
        result := 0;
        readln(a); readln(b);
        sumar(a, b, 0);
        write('La suma total es ',result);
        // averigua si el resultado final estuvo entre 10 y 30
        ok := (result >= 10) or (result <= 30);
        if (not ok) then
            write ('La suma no quedó entre 10 y 30');
    end.}

program ejercicio5;
{ suma los números entre a y b, y retorna el resultado en c }
    procedure sumar(a, b: integer; var c: integer); // 1- valor de parametros - cambiar a valor de retorno de la funcion!
    var
        suma,i : integer; // 2- declarar variable i
    begin
        suma:=0; // 3- inicializar suma
        for i := a to b do
            suma := suma + i;
            c := suma;
    end;
    var
        a,b,result : integer; // 4- declarar a y b
    begin
        result := 0;
        readln(a); readln(b);
        sumar(a, b, result); // 5- pasar result como referencia
        write('La suma total es ',result);
        {averigua si el resultado final estuvo entre 10 y 30}
        if (result >= 10) and (result <= 30) then // 6- cambiar mas facil a un if y cambiar el 'and' por el 'or'
        writeln(' La suma quedo entre 10 y 30')
    else
        writeln (' La suma no quedo entre 10 y 30');
    end.