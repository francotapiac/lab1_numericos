function [U] =cholesky(A)


[n,m]=size(A);
U = zeros(n,m);
for i = 1:n
    for j = 1:m
        suma = 0;
        if i == j
            for k = 1:i-1
                suma = suma + U(i,k)^2;
            end
            U(i,i) = sqrt(A(i,i) - suma);
        
        else
            for k = 1:j-1
                suma = suma + U(i,k)*U(j,k);
            end
            U(i,j) = (A(i,j) - suma)/U(j,j);
        end      
    end
end


 