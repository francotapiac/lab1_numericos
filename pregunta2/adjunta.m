function [resultado] = adjunta(matriz)
    
    [n,m] = size(matriz);
    matrizResultante = matriz;
    if n== m
        for i= 1:n
            for j= 1:m
                matrizAux = matriz;
                matrizAux(i,:) = [];
                matrizAux(:,j) = [];
                matrizResultante(i,j) = (-1)^(i+j)*determinante(matrizAux);
            end
        end
        resultado = matrizResultante;
        
    else
        fprintf(1,'Debe ingresar una matriz cuadrada.')
    end
end