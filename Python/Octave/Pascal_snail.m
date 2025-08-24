% Задаем размер сетки
n = 10;
% Создаем матрицу для хранения координат узлов
x = zeros(n,n);
y = zeros(n,n);

% Заполняем матрицу координат
for i = 1:n
  for j = 1:i
    x(i,j) = cos(2*pi*j/i) * i;
    y(i,j) = sin(2*pi*j/i) * i;
  end
end

figure;
hold on;
for i = 1:n
  plot(x(i, 1:i), y(i, 1:i),'-p');%строит линию, соединяющую точки, и отмечает каждую точку кругом
end
title('Улитка Паскаля');
xlabel('x');
ylabel('y');


hold off;
