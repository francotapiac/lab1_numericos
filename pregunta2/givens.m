function [x,error,tiempo,contadorSR,contadorPD] = givens(A,b)
 tiempo=cputime;
    
    contadorSR = 0;
    contadorPD = 0;
    [m n] = size(A);
    Q=eye(m);
    for j=1:n
        for i=1(j+1):m;
            if A(i,j)~=0
                xi = A(i,j);
                xj = A(i,j);
                G = rotacionGivens(m,i,j,xi,xj);
                Q = Q*G';
                A = G*A;
                contadorPD = contadorPD + 5;
            end
            contadorSR = contadorSR + 1;
        end
        contadorSR = contadorSR + 1;
    end

    x=inv(A) * Q' * b;
    tiempo=cputime-tiempo;
    contadorSR = contadorSR + 1;
    contadorPD = contadorPD + 2;
    error = norm(A*x-b);
    fprintf('Tiempo Givens % 2d\n',tiempo);
    fprintf('ContadorSR Givens % 2d \n',contadorSR);
    fprintf('ContadorPD Givens % 2d \n',contadorPD);
end