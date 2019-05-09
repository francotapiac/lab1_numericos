function [resultado] = simetrica(matriz)

    [n,m] = size(matriz);
    if n == m
        for i= 1:n
            for j= 1:m
                if matriz(i,j) ~= matriz(j,i)
                    resultado = false
                    return
                end
            end
        end
        resultado = true
    else
        fprintf(1,'Debe ingresar una matriz cuadrada.')
    end
    
end