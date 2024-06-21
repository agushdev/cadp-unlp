{Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera Analista en
TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un número entre 1 y 10).
La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe procesarse. Al finalizar la lectura
informar:
● La cantidad de alumnos aprobados (nota 8 o mayor).
● La cantidad de alumnos que obtuvieron un 7 como nota.
}

program a;

const
zidane ='Zidane Zinedine';

var
nombre: string;
nota,cantidad7,cantidad8: integer;

begin
    cantidad7:=0;
    cantidad8:=0;
    repeat
        writeln('Ingrese su nombre: '); readln(nombre);
        writeln('Ingrese su nota: '); readln(nota);
        if (nota>=8) then
            cantidad8:= cantidad8+1;
        if (nota<8) then
            cantidad7:= cantidad7+1;
    until (nombre = zidane);
        writeln('Cantidad de alumnos aprobados con 8 o mas: ',cantidad8);
        writeln('Cantidad de alumnos aprobados con 7: ',cantidad7);
end.