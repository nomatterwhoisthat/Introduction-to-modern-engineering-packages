function hyperplot(A)
    % Проверка является ли уравнение однополостным гиперболоидом или гиперболическим параболоидом
    if ishyper(A)
        % Параметризация кривых для построения семейства прямолинейных образующих
        t = linspace(-pi, pi, 100); % Параметр t для формирования углов прямолинейных образующих

        % Матрица, содержащая координаты точек прямолинейных образующих
        lines = zeros(3, length(t));

        % Построение семейства прямолинейных образующих
        for i = 1:length(t)
            x = cos(t(i));
            y = sin(t(i));
            z = t(i);
            lines(:, i) = [x; y; z];
        end

        % Построение графика семейства прямолинейных образующих
        plot3(lines(1, :), lines(2, :), lines(3, :), 'b-', 'LineWidth', 2);
        xlabel('X');
        ylabel('Y');
        zlabel('Z');
        title('Hyperboloid or Hyperbolic Paraboloid Generatrices');
        grid on;
        axis equal;
        hold on;

        % Построение поверхности гиперболоида или гиперболического параболоида
        hypersurf(A);
    else
        disp('The provided equation does not represent a hyperboloid or a hyperbolic paraboloid.');
    end
end
