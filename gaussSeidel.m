%funcion gaussSeidel
%Aii ~= 0
function[resultado] = gaussSeidel(A,b,error,iter)

    [n,m] = size(A);
    X0 = zeros(n,1); 
    Xk = zeros(n,1);
    resultado = [;];
    errores = zeros(n,1);
  
    norma = 1;
    
    for k= 1:iter
        
        if(error >= norma)
            break;
        end
        %Para cada fila de la matriz A
        for i = 1:n
            suma1 = 0;
            suma2 = 0;
            
            %Para cada columna desde 1 hasta la posición anterior a la
            %diagonal de la fila i
            for j= 1:i-1
                suma1 = suma1 + A(i,j)*Xk(j); %Sumatoria
            end
            %Para cada columna desde la posición siguiente de la diagonal
            %hasta m.
            for p= i+1:m
                suma2 = suma2 + A(i,p)*X0(p); %Sumatoria
            end
            
            Xk(i) = (b(i) + (-1)*(suma1 + suma2))/A(i,i); %Resultado de x según fila
            resultado(k,i) = Xk(i);
            norma = norm((Xk(i) - X0(i))/Xk(i));
            errores(k) = error  
        end
        X0 = Xk;
    end
    
    
end