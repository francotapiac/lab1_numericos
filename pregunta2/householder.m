function [x,error,tiempo,contadorSR,contadorPD] = householder(A,b)
    
    contadorSR = 0;
    contadorPD = 0;
    tiempo=cputime;
    [m,n] = size(A);
    Q = eye(m);      
    R = A;
    %Transformormacion QR
    for j = 1:n 
        normx = norm(R(j:end,j));
        s     = -sign(R(j,j));
        u1    = R(j,j) - s*normx;
        w     = R(j:end,j)/u1;
        w(1)  = 1;
        tau   = -s*u1/normx;
        %Reemplazando
        R(j:end,:) = R(j:end,:)-(tau*w)*(w'*R(j:end,:));
        Q(:,j:end) = Q(:,j:end)-(Q(:,j:end)*w)*(tau*w)';
        contadorSR = contadorSR + 4;
        contadorPD = contadorPD + 10;
    end
    %Obtener resultado
    z = inv(Q)*b;
    x = inv(R)*z; 
    error = norm(eye(m)-inv(Q*R)*A);
   tiempo=cputime-tiempo;
   contadorSR = contadorSR + 2;
   contadorPD = contadorPD + 4;
   fprintf('Tiempo Householder % 2d\n',tiempo);
   fprintf('ContadorSR Housholder % 2d \n',contadorSR);
    fprintf('ContadorPD Housholder % 2d \n',contadorPD);
end