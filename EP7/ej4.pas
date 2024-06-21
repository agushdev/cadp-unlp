{4. Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y
peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un
programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.}

program maternidad;

const
    dimF:= 42;

type
    vectorSemana=array [1..dimF] of real;

    infoPaciente= record
        nombre:string[20];
        apellido:string[20]
        pesoCadaSem: vectorSemana;
        dimL: 1..dimF;
    end;

    lista= ^nodo;
    nodo= record
        elem:infoPaciente
        sig: lista;
    end;

procedure cargarLista(var l:lista); // se dispone

function mayorSemana(v:vectorSemana; dimL:integer);
var 
    i,semanaMax:integer;
    peso, pesoMax: real;
begin
    pesoMax:= -1;
    semanaMax:= 0;
    for i:=1 to dimL do begin
        peso:= v[i];
        if(peso>pesoMax) then begin
            pesoMax:= peso;
            semanaMax:= i;
        end;
    end;
    mayorSemana:= semanaMax;
end;

function aumentoPeso(v:vectorSemana; dimL:integer);
var
    i:integer;
    aumentoTotal: real;
begin
    aumentoTotal:=0;
    for i:=2 to dimL do begin
        aumentoTotal:= aumentoTotal + (v[i] - v[i-1]);
    end;
    aumentoPeso:= aumentoTotal;
end;

procedure recorrerLista(l:lista);
begin
    while (l<>nil)do begin
        writeln('La semana con mayor aumento de peso es: 'mayorSemana(l^.elem.pesoCadaSem, l^.elem.dimL));
        writeln('El aumento de peso total es:'aumentoPeso(l^.elem.pesoCadaSem, l^.elem.dimL));
        writeln('#######')
    end;
end;

var
    l:lista;
    v:vectorSemana;
begin
    l:=nil;
    cargarLista(l); // se dispone
    recorrerLista(l);
end.