function [Y] = obtenerYDeL(A,b)

    [n,m] = size(A);
    Y = zeros(n,1);
    for i = 1:n
        suma = 0;
        for j= 1:m
             if i ~= j
                 suma = suma + A(i,j)*Y(j); %Se obtiene la sumatoria para cada fila
             end
        end
        Y(i) = (b(i) - suma)/A(i,i);
    end
    
end