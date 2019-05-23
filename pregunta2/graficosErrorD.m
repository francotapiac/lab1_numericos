function graficosErrorD(LU,cholesky,QR,givens,householder,nombre)

%CREATEFIGURE(Y1)
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

plot([LU],'og','MarkerSize',2,'MarkerFaceColor','g'); hold on;
plot([cholesky],'*m','MarkerSize',2,'MarkerFaceColor','m'); hold on;
plot([QR],'+b','MarkerSize',2,'MarkerFaceColor','b'); hold on;
plot([givens],'-dg','MarkerSize',2,'MarkerFaceColor','r'); hold on;
plot([householder],'-xm','MarkerSize',2,'MarkerFaceColor','c'); hold on;

title(nombre)
ylabel('Aproximaciones'); % y-axis label
xlabel('Variables'); % x-axis label
legend('Doolittle', 'Cholesky', 'QR', 'Givens', 'Householder');
end