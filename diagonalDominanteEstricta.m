%Función comprueba que diagonal de cada fila es mayor que la suma de los elementos
%restantes de esa fila.
%Usos: Jacobi

function [resultado] = diagonalDominanteEstricta(matriz)

    [n,m] = size(matriz);
    if n == m
        for i= 1:n
            valorDiagonal = abs(matriz(i,i));
            sumaNoDiagonales = 0;
            for j= 1:m
                if i ~= j
                    sumaNoDiagonales = sumaNoDiagonales + abs(matriz(i,j));
                end
            end
            if valorDiagonal <= sumaNoDiagonales
                resultado = 0;
                return
            end
        end
        resultado = 1;
    else
        fprintf(1,'Debe ingresar una matriz cuadrada.')
    end
         
end