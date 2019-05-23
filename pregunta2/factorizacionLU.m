%Se obtiene valor de x en operación Ax = b, con método LU

function [x,error, tiempo,contadorSR,contadorPD] = factorizacionLU(A,b)
    tiempo=cputime;
    contadorSR = 0;
    contadorPD = 0;
    %Ax = LUx
    [n,m]=size(A);
    L = zeros(n,m);
    U = zeros(n,m);
    
    %Se factoriza valor L y U, donde L posee diagonal de 1's.
    for k=1:n
        U(k,k:n)=A(k,k:n)-L(k,1:k-1)*U(1:k-1,k:n);
        L(k,k)=1;
        L(k+1:n,k)=(A(k+1:n,k)-L(k+1:n,1:k-1)*U(1:k-1,k))/U(k,k);
        contadorSR = contadorSR + 10;
        contadorPD = contadorPD + 3;
    end
    tiempo=cputime-tiempo;
    contadorSR = contadorSR + 1;
    y = obtenerYDeL(L,b); %y = Ux
    x = obtenerXDeU(U,y);
    error = norm(eye(n)-inv(L*U)*A);
    fprintf('Tiempo LU % 2d \n',tiempo);
    fprintf('ContadorSR LU % 2d \n',contadorSR);
    fprintf('ContadorPD LU % 2d \n',contadorPD);
end