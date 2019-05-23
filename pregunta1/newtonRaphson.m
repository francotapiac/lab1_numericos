function [raices,errores,contadorSR,contadorPD] = newtonRaphson(funciones,x0,tol,iter)
    tiempo=cputime;
    contadorSR = 0;
    contadorPD = 0;
    x0 = x0';
    variables = symvar(funciones); %obtencion de variables en funciones
    errores = [];
    raices = [];
    j = jacobian(funciones); %jacobiano 
    contador = 1;
    while contador <= iter
        f = subs(funciones,variables,x0); %se reemplazan valores de x0 en función f
        df = subs(j,variables,x0); %se reemplazan valores de x0 en jacobiano
        x1 = x0' - inv(df)*f; %obtención de x siguiente
        raices = [raices,x1];
        error = norm(x1 - x0, inf)/norm(x1, inf);
        errores = [errores,error];
        x0 = x1';
        fprintf('Iter % 2d raiz x=(%14.9f,%14.9f,%14.9f) f(x)=(%14.9f,%14.9f,%14.9f)\n',contador,raices(1,contador),raices(2,contador),raices(3,contador),f(1),f(2),f(3));
      
        if error < tol
            break;
        end
        contador = contador + 1;
        contadorSR = contadorSR + 3;
        contadorPD = contadorPD + 2;
    end
    contadorSR = contadorSR + 3;
    fprintf('Tiempo Newton % 2d\n',tiempo);
end