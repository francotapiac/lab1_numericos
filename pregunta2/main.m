


function main(metodo,tipoMatriz)


if tipoMatriz == 1
    A = load('datos/289x289/A289.dat'); 
    b = load('datos/289x289/b289.dat');
    
elseif tipoMatriz == 2
    A = load('datos/1089x1089/A1089.dat'); 
    b = load('datos/1089x1089/b1089.dat');
    
elseif tipoMatriz == 3
    A = load('datos/4225x4225/A4225.dat'); 
    b = load('datos/4225x4225/b4225.dat');
    
else
    fprintf('Error entrada 1: debe ingresar valores 1,2 o 3%',1);

end

[n,m] = size(A);

if metodo == 1
    [xJacobi,erroresJ,tiempoJ] = gaussJacobi(A,b,1.e-15);
    [xSeidel,erroresS,tiempoS]= gaussSeidel(A,b,1.e-15);
    graficosIterativos(xJacobi,xSeidel,'Grafico método iterativo');
    graficarErroresIt(erroresJ,erroresS,'Gráfico error iterativo');
    tiempoTotal = tiempoJ + tiempoS;
    fprintf('Tiempo Total: % 2d\n',tiempoTotal);



elseif metodo == 2
    [xLu,errorLU,tiempoLU] =factorizacionLU(A,b);
    [xCh,errorCh,tiempoCh] = cholesky(A,b);
    [xQR,errorQr, tiempoQR] = metodoQR(A,b);
    [xG,errorGivens,tiempoG] = givens(A,b);
    [xH,errorH,tiempoH] = householder(A,b);
    tiempoTotal = tiempoLU + tiempoCh + tiempoQR +tiempoG + tiempoH;
    graficosDirecto(xLu,xCh,xQR,xG,xH,'Grafico método directo');
    fprintf('Tiempo Total: % 2d\n',tiempoTotal);
    
else
    fprintf('Error entrada 2: debe ingresar valores 1 o 2%',1);
end








end