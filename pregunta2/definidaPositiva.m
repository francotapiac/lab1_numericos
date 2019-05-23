function [resultado] = definidaPositiva(matriz)
    
    [n,m] = size(matriz);
    if n == m
       for i= 1:n
           matrizAux = matriz(1:i,1:i);
           valor = determinante(matrizAux);
           if valor <= 0
               resultado = 0;
               return
           end          
       end
    resultado = 1;
    else   
        fprintf(1,'Debe ingresar una matriz cuadrada')
    end
end