{a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.}


//constantes
// crear constante dimension fisica

//type
// crear vector

// procedimiento de cargar vector con parametro del vector y dimension logica
// variable num
// begin
//      leer num
//      mientras que el num sea distinto a 1 Y la dimLogica sea menor a la dimFisica. Hacer BEGIN
//          incrementar dimension logica
//          el indice pasa a ser la dimLogica, en el primer caso vale 1, entonces le pasas el valor de num a vec[]
//          leer siguiente numero
//      end
// end

//funcion para buscar si hay un valor n. pasar parametros de vector, numero n y dimension logica. : el resultado que de un boolean
// var i para recorrer; un ok para que retorne si encontro o no.
// begin
//      inicializas ok como falso, y se vuelve true cuando encuentra
//      recorrer vector con for i to diml hacer begin
//              si la posicion i del vector es igual a n hacer
//                  el ok:= verdadero porque lo encontro al num
//      end
//      funcion sea igual a ok
//end

// variable local
// dimL,n entero
// vec vector

// programa principal
// begin
//      inicializo dimension logica en 0
//      llamo cargarvector con parametro (vec,dimL)
//      leemos un numero para la variable n
//      si la busqueda es igual a verdadero entonces
//          imprimir se encontro
//      sino imprimir no se encontro
// end

program a;

const
    dimF=3;
type
    vector=array[1..dimF] of integer;

procedure cargarVector(var v:vector; var dimL:integer);
var 
    num:integer;
begin
    readln(num);
    while (num<>-1) and (dimL<dimF) do begin
        dimL:= dimL+1;
        v[dimL]:=num;
        readln(num);
    end;
end;

function busqueda(var v:vector; var dimL:integer; var n:integer): boolean;
var 
    i:integer;
    ok:boolean;
begin
    ok:=false;
    for i:=1 to dimL do begin
        if (v[i]=n) then ok:=true;
    end;
    busqueda:=ok;
end;

var
    dimL,num:integer;
    vec:vector;
begin
    dimL:=0;
    cargarVector(vec,dimL);
    readln(num);
    if (busqueda(vec,dimL,num)=true)then writeln('Se encontro')
    else writeln('No se encontro');
end.