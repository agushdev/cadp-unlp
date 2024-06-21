{Dado el siguiente programa, indicar cuál es el error y su causa: falta declarar variable b fuera del procedure}

program alcance3;

var a: integer;

procedure uno;
var b: integer;
begin
b:= 2;
writeln(b);
end;

begin
a:= 1;
uno;
writeln(a, b);
end.