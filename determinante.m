function [resultado] = determinante(matriz)
    resultado = determinanteR(matriz);
end

function [resultado] = determinanteR(matriz)
    [n,m] = size(matriz);
    resultado = 0;
    if n == m
        if n == 2
            resultado = matriz(1,1)*matriz(2,2) - matriz(1,2)*matriz(2,1); 
        elseif n > 2
            for i = 1:n
                signo = (-1)^(i+1);
                matrizAux = matriz;
                matrizAux(:,i) = [];
                matrizAux(1,:) = [];
                resultado = resultado + signo*matriz(1,i)*determinanteR(matrizAux)
            end
        else 
            resultado = matriz;
        end
        
    end
end