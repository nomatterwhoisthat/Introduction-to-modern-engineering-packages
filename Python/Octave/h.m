x = 0:0.01:2
y = humps(x)
plot(x, y)
hold on
grid on
x_max = fminbnd(@(x) -humps(x), 0, 2)
y_max = humps(x_max)
f_y_max = 0:y_max
plot(x_max, f_y_max, 'LineStyle', '--', 'color', 'g')

indexes = find(y >= 20 & y <= 40)
x_vals = x(indexes)
y_vals = y(indexes)
plot(x_vals, y_vals, 'o', 'color', 'm')

hold off
