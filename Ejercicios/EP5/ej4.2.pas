{4) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio.
B)
51
4
}

program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc^), ' bytes');
    writeln(pc^);
    dispose(pc);
    pc^:= 'otro nuevo nombre';
end.