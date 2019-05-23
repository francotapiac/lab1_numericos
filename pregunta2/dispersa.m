function [resultado] = dispersa(matriz)

    [n,m] = size(matriz);
    contador = 0;
    cantidadNumeros = n*m;
    for i= 1:n
        for j= 1:m
            if matriz(i,j) == 0
                contador = contador + 1;
            end
            if contador > cantidadNumeros/2
                resultado = true;
                return
            end
        end
    end
    resultado = false
    return
end
