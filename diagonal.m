%función obtiene la matriz diagonal
function [resultado] = diagonal(matriz)
    [n,m] = size(matriz);
    if n == m
        resultado = zeros(n,m); %se asigna valor cero a toda la matriz
        for i = 1:n
            resultado(i,i) = matriz(i,i);%se copia todos los valores de diagonales en matriz resultado.
        end
        else   
        fprintf(1,'Debe ingresar una matriz cuadrada')
    end
end