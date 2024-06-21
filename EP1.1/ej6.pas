// Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
// lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
// Por ejemplo, se lee la siguiente secuencia:
// 33423
// 8.40
// 19003
// 6.43
// -1
// En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo
// 19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un
// promedio).
// Al finalizar la lectura, informar:
// a. La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).
// b. La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar
// 1).
// c. El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
// menor al valor 2500 (en el ejemplo anterior se debería informar 0%).

program a;

var
    legajo,promedio,nota: real;
    alumnos,aprobados,destacados: integer;
begin
    legajo:=0;
    promedio:=0;
    alumnos:=0;
    aprobados:=0;
    destacados:=0;
    nota:=0;

    while (legajo<>-1) do
        begin
            write('Ingrese el legajo: ');
            read(legajo);
            alumnos:=alumnos+1;
            write('Ingrese la nota: ');
            read(nota);
            if(nota>6.5)then
                aprobados:=aprobados+1;
            if(nota>8.5)then
                destacados:=destacados+1;
        end;
    promedio:=(alumnos/100)*destacados;
    writeln('La cantidad de alumnos leida es ',alumnos);
    writeln('Los alumnos aprobados son ', aprobados);1
    writeln('El promedio de los que tienen mas de 8.5 es: ', promedio:2:2);
end.
