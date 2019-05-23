function [x,metodo] = mainSeleccion(A,b,tol)
%Matriz cuadrada
x = [];
[n m] = size(A);
    if n == m
        if dispersa(A)
            [a] = givens(A,b);
            metodo = ['Givens'];
            x = [x a];
        elseif simetrica(A)
            if definidaPositiva(A)
                [a] = cholesky(A,b);
                x = [x a];
                metodo = ['Cholesky'];
            else
                [a] = householder(A,b);
                x = [x a];
                metodo=['Householder'];
            end
        elseif diagonalDominante(A)
               diagonalDominante(A);
                [a b c] = gaussSeidel(A,b,tol);
                x = [x a];
                metodo=['Gauss-Seidel'];
        end
    end
  end


  

