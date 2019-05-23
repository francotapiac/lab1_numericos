%Función encargada de entregar una matriz triangular inferior
function [L] = triangularInferior(matriz,entrada)
    [n,m] = size(matriz);
    if n == m
        L = zeros(n,m);
        for i = 1:n 
            for j= 1:i %se recorre cada columna hasta la diagonal
                L(i,j) = matriz(i,j);
            end
            if entrada == -1
                L(i,i) = 1;
            end
            
        end
    else
        fprintf(1,'Debe ingresar una matriz cuadrada')
    end        
 end