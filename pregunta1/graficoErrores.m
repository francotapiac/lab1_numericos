function graficoErrores(errores,nombre)

    

figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

% Create plot
plot([errores],'-ob','MarkerSize',5,'MarkerFaceColor','b'); hold on;

title(nombre)
ylabel('Errores') % y-axis label
xlabel('Iteraciones') % x-axis label

legend('Error NR')

end