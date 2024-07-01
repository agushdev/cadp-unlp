{Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.}

program a;

type
    str20=string[20];
    procesador=record
       marca:str20;
       linea:str20;
       cantNucleos:integer;
       velocidadReloj:real;
       tamanioTransistores:integer;
    end;
    marcaCantidad=record
        marca:str20;
        cantidad:integer;
    end;

procedure LeerInfo(var p:procesador);
begin
    write('Ingrese marca de proce: '); readln(p.marca);
    if (p.marca <> '') then begin
        write('Ingrese linea del procesador: '); 
        readln(p.linea);
        write('Ingrese cantidad de nucleos: '); 
        readln(p.cantNucleos);
        if (p.cantNucleos > 0) then begin
            write('Ingrese velocidad de reloj (GHz): '); 
            readln(p.velocidadReloj);
            write('Ingrese tamanio de transistores (nm): '); 
            readln(p.tamanioTransistores);
        end;
    end;
end;

procedure InformarMayorNucleo(var p:procesador; var contador:integer);
begin
    if (p.cantNucleos>2) and (p.tamanioTransistores<=22) then begin
        writeln('Procesador con mas de 2 nucleos y transistores <= 22 nm: ', p.marca, ' ', p.linea);
        contador := contador + 1;
    end;
end;

procedure ActualizarMaximoMarcas(var p:procesador; var marca1,marca2: marcaCantidad);
begin
    if (p.tamanioTransistores=14) then begin
        if (marca1.marca='') or (marca1.marca=p.marca) then begin
            marca1.marca := p.marca;
            marca1.cantidad := marca1.cantidad+1;
        end
        else if(marca2.marca = '') or (marca2.marca = p.marca) then begin
            marca2.marca:= p.marca;
            marca2.cantidad:= marca2.cantidad+1;
        end;
    end;
end;

procedure ContadorMulticore(var p:procesador; var contadorMulticore:integer);
begin
    if (p.cantNucleos>1) and ((p.marca=('Intel'))or(p.linea=('AMD'))) and (p.velocidadReloj>=2) then begin
        contadorMulticore:= contadorMulticore+1;
    end;
end;

procedure ImprimirResultado(marca1, marca2: marcaCantidad; contadorMulticore: integer);
begin
    writeln('Las dos marcas con mayor cantidad de procesadores de 14 nm:');
    if (marca1.cantidad > 0) then
      writeln('1. Marca: ', marca1.marca, ', Cantidad: ', marca1.cantidad)
    else
      writeln('1. No hay procesadores de 14 nm');
    if (marca2.cantidad > 0) then
      writeln('2. Marca: ', marca2.marca, ', Cantidad: ', marca2.cantidad)
    else
      writeln('2. No hay procesadores de 14 nm');

    writeln('Cantidad de procesadores multicore Intel/AMD con velocidad >= 2 GHz: ', contadorMulticore);
end;

var
    contador2Core22nm:integer;
    proce:procesador;
    marca14nm1,marca14nm2:marcaCantidad;
    contadorMulti:integer;

begin
    contador2Core22nm:=0;
    marca14nm1.marca:='';
    marca14nm1.cantidad:=0;
    marca14nm2.marca:='';
    marca14nm2.cantidad:=0;
    contadorMulti:=0;

    LeerInfo(proce);

    while (proce.cantNucleos>0) do begin
        InformarMayorNucleo(proce,contador2Core22nm);
        ActualizarMaximoMarcas(proce,marca14nm1,marca14nm2);
        ContadorMulticore(proce,contadorMulti);
        LeerInfo(proce)
    end;
    
    ImprimirResultado(marca14nm1,marca14nm2,contadorMulti);
end.