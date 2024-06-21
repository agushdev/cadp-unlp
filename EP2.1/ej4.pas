{Dado los siguientes programas, explicar la diferencia: En el program 1 se declara variable y dsp el procedure, 
en el program 2 primero el procedure cuando no se declaro la variable }

{program alcance4a;

var a,b: integer;

procedure uno;
begin
a := 1;
writeln(a);
end;

begin
a:= 1;
b:= 2;
uno;
writeln(b, a);
end.}

program alcance4b;

procedure uno;
begin
a := 1;
writeln(a);
end;

var a,b: integer;

begin
a:= 1;
b:= 2;
uno;
writeln(b, a);
end.