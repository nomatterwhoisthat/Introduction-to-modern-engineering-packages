pkg load symbolic
function find_intersection_points(r)

    xc = 2;
    yc = 4;

    syms x y;
    eq1 = (x - xc)^2 + (y - yc)^2 - r^2;
    eq2 = y - x/2 - 1;

    [x_intersect, y_intersect] = solve(eq1, eq2);

    theta = linspace(0, 2*pi, 1000);
    xc_plot = xc + r*cos(theta);
    yc_plot = yc + r*sin(theta);
    plot(xc_plot, yc_plot, 'b', 'LineWidth', 1.5);
    hold on;

    x = linspace(xc - r - 2, xc + r + 2, 1000);
    y = x/2 + 1;
    plot(x, y, 'r', 'LineWidth', 1.5);

    plot(double(x_intersect), double(y_intersect), 'ro', 'MarkerSize', 8);

    axis equal;
    xlim([xc - r - 2, xc + r + 2]);
    ylim([yc - r - 2, yc + r + 2]);

    xlabel('x');
    ylabel('y');
    title('Intersection Points of Circle and Line');
    legend('Circle', 'Line', 'Intersection Points', 'Location', 'northeast'); % Change 'best' to 'northeast'
    grid on;


    hslider = uicontrol('style', 'slider', ...
                       'Units', 'normalized', ...
                       'position', [0.1, 0.05, 0.8, 0.05], ...
                       'min', 1, ...
                       'max', 10, ...
                       'value', r, ...
                       'sliderstep', [0.1, 0.1], ...
                       'callback', {@update_plot, xc, yc});
     hold off;

end

function update_plot(h, ~, xc, yc)
    r = get(h, 'value');
    find_intersection_points(r);
end
