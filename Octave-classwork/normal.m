clear;

[x,y] = meshgrid(-pi:0.1:pi, -pi:0.1:pi);
x_0 = 0;
y_0 = 0;
z = @(x,y) 20 - x.^2 - y.^2;
z_0 = z(x_0,y_0);
surf(x,y,z(x,y));
hold on;

delta = 0.001;
dzdx = @(x,y) (z(x+delta,y) - z(x,y))/delta;
dzdy = @(x,y) (z(x,y+delta) - z(x,y))/delta;

t = linspace(-10,10,1000);
x_ = x_0 + t .* dzdx(x_0,y_0);
y_ = y_0 + t .* dzdy(x_0,y_0);
z_ = z_0 - t;


plot3(x_,y_, z_,'color','red', 'r-', 'LineWidth', 1);
hold off;
