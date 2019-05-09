function [resultado] = jacobi(A,b,error,iter)

    [n,m] = size(A);
    resultado =[;];
    X0 = zeros(n,1);
    Xk = zeros(n,1);
    errores = zeros(n,1);
    norma = 1;
    
    for k = 1:iter
        if(error >= norma)
            break;
        end
        for i = 1:n
            suma = 0;
            for j= 1:m
                 if i ~= j
                     suma = suma + A(i,j)*X0(j); %Se obtiene la sumatoria para cada fila
                 end
            end
            Xk(i) = (b(i) - suma)/A(i,i);
            resultado(k,i) =Xk(i);
            norma = norm((Xk(i) - X0(i))/Xk(i));
            errores(k) = error  
        end
        X0 = Xk;
    end
end