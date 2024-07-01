{4) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio. 
A)
pc no reservo memoria dinamica, por lo tanto da error
}

program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    pc^:= 'un nuevo texto';
    new(pc);
    writeln(pc^);
end.