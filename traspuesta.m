function [resultado] = traspuesta(matriz)
    [n,m] = size(matriz);
    resultado = zeros(n,m);
    for i= 1:n
        for j= 1:m
            resultado(j,i) = matriz(i,j);
        end
    end
    
end
