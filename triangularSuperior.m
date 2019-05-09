%Función encargada de entregar una matriz triangular superior

function [U] = triangularSuperior(matriz)
    [n,m] = size(matriz);
    if n == m
        U = zeros(n,m);
        for i = 1:n
            for j= i:n %se recorre cada columna desde la diagonal hasta el final de la matriz
                U(i,j) = matriz(i,j);
            end
        end
    else
        fprintf(1,'Debe ingresar una matriz cuadrada')
    end        
 end