function [resultado] = inversa(matriz)

    [n,m] = size(matriz);
    if(n == m)
        determinanteMatriz = determinante(matriz);
        if determinanteMatriz ~= 0
            resultado = adjunta(traspuesta(matriz))/determinanteMatriz;
        else
            fprintf(1,'El valor del determinante no puede ser 0.')
        end
    else
        fprintf(1,'Debe ingresar una matriz cuadrada.')
    end
end