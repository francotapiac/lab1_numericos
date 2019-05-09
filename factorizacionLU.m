%Se obtiene valor de x en operación Ax = b, con método LU

function [x,y] = factorizacionLU(A,b)
     
    %Ax = LU
    [n,m]=size(A);
    L = zeros(n,m);
    U = zeros(n,m);
    
    %Se factoriza valor L y U, donde L posee diagonal de 1's.
    for k=1:n
        U(k,k:n)=A(k,k:n)-L(k,1:k-1)*U(1:k-1,k:n);
        L(k,k)=1;
        L(k+1:n,k)=(A(k+1:n,k)-L(k+1:n,1:k-1)*U(1:k-1,k))/U(k,k);

    end
    y = obtenerYDeL(L,b)
    x = obtenerXDeU(U,y)
end