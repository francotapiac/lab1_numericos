function main()
    syms x y z
    syms f g h
    f = x^2 + y -37;
    g = x - y^2 - 5;
    h = x + y + z -3;
    x0 = [0; 0; 0];
    tolerancia = 1.e-15;
    maxiter = 8;
    [raices,errores,contadorSR,contadorPD] = newtonRaphson([f;g;h],x0,tolerancia,maxiter);
    graficoNR(raices,'Gráfico raices Newton Raphson multivariable');
    graficoErrores(errores,'Gráfico errores Newton Raphson multivariable');
    
end