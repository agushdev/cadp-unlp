{El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b. Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad de
alumnos y la cantidad de docentes).}


program a;

const
unesco=23.435;
totalEscuelas=3;

type
    str20=string[20];
    colegio=record
        CUE:integer;
        nombreEstablecimiento:str20;
        cantDocentes:integer;
        cantAlumnos:integer;
        localidad:str20;
    end;

procedure leerInfo(var establecimiento:colegio);
begin
    write('Ingresar codigo del establecimiento: '); readln(establecimiento.CUE);
    write('Ingresar nombre del establecimiento: '); readln(establecimiento.nombreEstablecimiento);
    write('Ingresar cantidad de docentes: '); readln(establecimiento.cantDocentes);
    write('Ingresar cantidad de alumnos: '); readln(establecimiento.cantAlumnos);
    write('Ingresar localidad del establecimiento: '); readln(establecimiento.localidad);
end;

procedure relacionAlumnoDocente (var establecimiento:colegio; var relacion:real);
begin
    if establecimiento.cantDocentes = 0 then
    relacion:= 0
else
    relacion:= establecimiento.cantAlumnos / establecimiento.cantDocentes;
end;

procedure actualizarMaximo(var c:colegio; var relacion:real; var max1,max2:real; var nombre1,nombre2:str20; var cue1,cue2:integer);
begin
    if (relacion>max1) then begin
        max2:=max1;
        nombre2:=nombre1;
        cue2:=cue1;
        max1:=relacion;
        nombre1:=c.nombreEstablecimiento;
        cue1:=c.CUE;
    end
    else if (relacion>max2) then begin
        max2:= relacion;
        nombre2:=c.nombreEstablecimiento;
        cue2:=c.CUE;
    end;
end;

var
cole:colegio;
relacion:real;
i,escuelaSuperan:integer;
max1,max2:real;
nombre1,nombre2:str20;
cue1,cue2:integer;


begin
    escuelaSuperan:=0;
    max1:=-9999;
    max2:=-9999;
    nombre1:='';
    nombre2:='';
    cue1:=-1;
    cue2:=-1;

    for i:=1 to totalEscuelas do
        begin
            leerInfo(cole);
            relacionAlumnoDocente(cole,relacion);

            if(cole.localidad = 'La Plata') and (relacion>unesco) then 
            begin
                escuelaSuperan:=escuelaSuperan+1;
            end;
            actualizarMaximo(cole,relacion,max1,max2,nombre1,nombre2,cue1,cue2);
        end;

    writeln('Cantidad de escuelas en La Plata con una relacion superior a la sugerida por UNESCO: ', escuelaSuperan);
    writeln('Las dos escuelas con la mejor relacion entre docentes y alumnos son:');
    writeln('1. ', nombre1, ' CUE: ', cue1, ' con relacion de ', max1:0:2);
    writeln('2. ', nombre2, ' CUE: ', cue2, ' con relacion de ', max2:0:2);
end.