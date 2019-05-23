function [soluciones, errores,xs,contadorSR,contadorPD] = gaussSeidel(A, b, tol)
tiempo=cputime;
    [M ,N] = size(A);
    D = zeros(M, N);
    E = zeros(M, N);
    F = zeros(M, N);
    aux = 1;
    contadorSR = 0;
    contadorPD = 0;
    for i = 1 : M
       D(i, i) = A(i, i);
       for j = 1 : aux
          E(i, j) = A(i, j); 
          F(j, i) = A(j, i);
       end
       E(i, i) = 0;
       F(i, i) = 0;
       aux = aux + 1;
       contadorSR = contadorSR + 1;
    end
    x0 = zeros(N ,1);
    soluciones = [];
    errores = [];
    for i = 1 : 100
       j = inv(D+E) * -F;
       c = inv(D+E) * b;
       x1 = j*x0 + c;
       e = norm(x1 - x0, inf)/norm(x1, inf);
       soluciones = [soluciones, x1];
       errores = [errores, e];
       contadorSR = contadorSR + 4;
       contadorPD = contadorPD + 4;
       if(e < tol)
           break
       end
       x0 = x1;
    end
    xs = x1;
     tiempo=cputime-tiempo;
    contadorSR = contadorSR + 1;
    fprintf('Tiempo Seidel % 2d\n',tiempo);
    fprintf('ContadorSR Seidel % 2d \n',contadorSR);
    fprintf('ContadorPD Seidel % 2d \n',contadorPD);
end