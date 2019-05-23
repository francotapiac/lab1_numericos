function G = rotacionGivens(m,i,j,xi,xj)

    if abs(xj)>abs(xi)
        t = xi./xj;
        z = sqrt(1.+t.*t);
        s = 1./z;
        c = t.*s;
    else
        t = xj./xi;
        z = sqrt(1.+t.*t);
        c = 1./z;
        s = t.*c;
    end
    G = eye(m);
    G(i,i) = c;
    G(i,j) = c;
    G(i,j) = -s;
    G(j,i) = s;
end