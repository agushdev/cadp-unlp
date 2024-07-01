{La función analizarLetra fue declarada como un submódulo dentro del procedimiento leer, pero esto
puede traer problemas en el código del programa principal.
i) ¿Qué clase de problema encuentra?
ii) ¿Cómo se puede resolver el problema para que el programa compile y funcione correctamente?}

program anidamientos;

var letra:char;

function analizarLetra : boolean;
    begin
        if (letra >= 'a') and (letra <= 'z') then
            analizarLetra := true
        else
            analizarletra := false;
    end;

procedure leer;
begin
    readln(letra);
    if (analizarLetra) then
        writeln('Se trata de una minuscula')
    else
        writeln('Se trata de una mayuscula o caracter especial');
end; { fin del procedure leer}

var
    ok : boolean;
begin { programa principal }
    leer;
    ok := analizarLetra;
    if ok then
        writeln('Gracias, vuelva prontosss');
end.

{program anidamientos;

procedure leer;
var
    letra : char;
function analizarLetra : boolean
    begin
        if (letra >= ‘a’) and (letra <= ‘z’) then
            analizarLetra := true;
        else
        if (letra >= ‘A’) and (letra <= ‘Z’) then
            analizarletra := false;
    end;  fin de la funcion analizarLetra 
begin
    readln(letra);
    if (analizarLetra) then
        writeln(‘Se trata de una minúscula’)
    else
        writeln(‘Se trata de una mayúscula’);
end;  fin del procedure leer

var
    ok : boolean;
begin  programa principal 
    leer;
    ok := analizarLetra;
    if ok then
        writeln(‘Gracias, vuelva prontosss’);
end.
}