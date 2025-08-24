function tangenta(f, dmin, dmax, n)
    % Нужно равномерно разбить интервал [dmin, dmax]
    ds = linspace(dmin, dmax, 2*n+1);

    % Создаем массив, в котором будут храниться значения функции f в каждой точке из ds
    fs = zeros(2, 2*n+1);
    for i = 1:length(ds)
        fs(:, i) = f(ds(i));
    end

    % Вычисляются значения производной векторной функции f в каждой точке из ds с использованием функции diffi
    dfs = diffi(f, ds);

    % Вычисление среднего значения параметра для построения касательной
    d_mid = (dmin + dmax) / 2;

    % Вычисление координат начальной и конечной точек касательной
    x_start = dmin;
    x_end = dmax;
    y_start = fs(2, 1) + dfs(2, 1) * (d_mid - ds(1));
    y_end = fs(2, end) + dfs(2, end) * (d_mid - ds(end));

    % Построение графика самой функции и ее касательной
    figure;
    plot(fs(1, :), fs(2, :), 'b-', 'LineWidth', 2);
    hold on;
    plot([x_start, x_end], [y_start, y_end], 'r--', 'LineWidth', 2);
    axis equal;
    xlabel('X');
    ylabel('Y');
    title('Graph of the curve and its tangent');
    legend('Function', 'Tangent');
    hold off;
end
