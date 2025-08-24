function [point1, point2] = bridgy(y1, y2)
  % Создание сетки значений x для вычисления расстояния между функциями
  x_values = linspace(0, 100, 1000);

  % Вычисление расстояния между функциями для каждого значения x
  bridge_heights = arrayfun(y2, x_values) - arrayfun(y1, x_values);
  
  % Найти x, где расстояние между функциями минимально
  [~, best_x_index] = min(bridge_heights);
  best_x = x_values(best_x_index);

  % Вернуть x-координаты точек на берегах реки
  point1 = [best_x, y1(best_x)];
  point2 = [best_x, y2(best_x)];

end

% Пример использования
##function y = y1(x)
##  y = 2 * x;
##end
##
##function y = y2(x)
##  y = 2.^x;
##end
##
##
##[point1, point2] = bridgy(@y1, @y2);
##disp("Координаты точки на первом берегу:");
##disp(point1);
##disp("Координаты точки на втором берегу:");
##disp(point2);
