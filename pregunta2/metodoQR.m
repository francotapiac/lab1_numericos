function [x,error, tiempo,contadorSR,contadorPD] = metodoQR(A,b)
    contadorSR = 0;
    contadorPD = 0;
    tiempo=cputime;
    x = [];
    [m, n] = size(A);
    R = zeros(n, n);
    V = A;
    Q=zeros(m, n);

    for i =1:n
        R(i,i)= norm(V(:,i));
        Q(:,i)= V(:,i)/R(i,i);
        for j=i+1:n
           R(i,j)= (Q(:,i)')*V(:,j);
           V(:,j)=V(:,j) - R(i,j)*Q(:,i);
           contadorSR = contadorSR + 2;
           contadorPD = contadorPD + 2;
        end
        contadorSR = contadorSR + 1;
    end
    
    Qtrasp=Q';
    invaux=(R\Qtrasp);
    x=invaux*b;
    tiempo=cputime-tiempo;
    contadorSR = contadorSR + 1;
    contadorPD = contadorPD + 2;
    error = norm(eye(m)-inv(Q*R)*A);
    fprintf('Tiempo QR % 2d\n',tiempo);
    fprintf('ContadorSR QR % 2d \n',contadorSR);
    fprintf('ContadorPD QR % 2d \n',contadorPD);
end