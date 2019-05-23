function [x,error,tiempo,contadorSR,contadorPD]=cholesky(A, b)
    tiempo=cputime;
    [n,m]=size(A);
    contadorSR = 0;
    contadorPD = 0;

    for k = 1:n
        A(k,k) = sqrt(A(k,k));
        A(k+1:n,k) = A(k+1:n,k)/A(k,k);
        for j = k+1:n
            A(j:n,j) = A(j:n,j) - A(j,k)*A(j:n,k);
            contadorSR = contadorSR + 2;
            contadorPD = contadorPD + 1;
        end
        contadorSR = contadorSR + 3;
        contadorPD = contadorPD + 1;
    end
    
    L = triangularInferior(A,1);
    LT = L';
    z = inv(L)*b;
    x = inv(LT)*z;
    error = norm(eye(n)-inv(L*LT)*A);
    tiempo=cputime-tiempo;
    contadorSR = contadorSR + 2;
    contadorPD = contadorPD + 4;
    fprintf('Tiempo Cholesky % 2d\n',tiempo);
    fprintf('ContadorSR Cholesky % 2d \n',contadorSR);
    fprintf('ContadorPD Cholesky % 2d \n',contadorPD);
end



 