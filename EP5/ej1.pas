{1) ¿Qué se define como memoria estática?
La memoria estática tiene una duración fija, que se reserva y libera de forma automática
Memoria estatica: es un espacio de memoria reservado para x variable donde esta no se puede cambiar durante el tiempo de ejecucion.
Por ejemplo una variable asignada a una constante

2) ¿Qué se define como memoria dinámica?
La memoria dinámica se reserva de forma explícita y continúa existiendo hasta que sea liberada, generalmente por parte del programador
Memoria dinamica: es un espacio de memoria reservado para x variable.
Dinamica se refiere a que en el transcurso de la ejecucion del programa esta memoria puede ir cambiando, por ejemplo incrememtando.
Como un arreglo, tienes tu arreglo, y en tiempo de ejecucion lo llenas.

3) ¿Qué es una variable de tipo puntero?
Es un tipo de variable usada para almacenar una dirección en memoria dinámica.
En esa dirección de memoria se encuentra el  valor real que almacena.
El valor puede ser de cualquiera de los tipos vistos (char, boolean, integer, real, string, registro, arreglo u otro puntero ). 
Un puntero es un tipo de datos simple.

4) ¿Qué hace la operación “NEW” aplicada en una variable del tipo puntero?
Implica reservar una dirección memoria dinámica libre para poder asignarle contenidos a la dirección que contiene la variable de tipo puntero. new(variable tipo puntero)

5) ¿Qué hace la operación “DISPOSE” aplicada en una variable del tipo puntero?
Implica liberar la memoria dinámica que contenía la variable de tipo puntero. dispose(variable tipo puntero)
}
{1) Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.
}
program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    writeln(sizeof(pc), ' bytes');
new(pc);
    writeln(sizeof(pc), ' bytes');
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc), ' bytes');
    writeln(sizeof(pc^), ' bytes');
    pc^:= 'otro nuevo nombre distinto al anterior';
    writeln(sizeof(pc^), ' bytes');
end.