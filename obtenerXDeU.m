%Función que recorre matriz y obtiene valor de incognitas según U
function [X] = obtenerXDeU(A,b)

    [n,m] = size(A);
    X = zeros(n,1);
    for i = n:-1:1
        suma = 0;
        for j= m:-1:1 %contador regresivo
             if i ~= j
                 suma = suma + A(i,j)*X(j); %Se obtiene la sumatoria para cada fila
             end
        end
        X(i) = (b(i) - suma)/A(i,i) %valor de Xi según fila de la matriz
    end
    
end