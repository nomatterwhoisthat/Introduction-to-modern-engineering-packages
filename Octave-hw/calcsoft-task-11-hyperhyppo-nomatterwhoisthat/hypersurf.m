function hypersurf(A)
    if ishyper(A)
        % Вычисляем определитель матрицы 3x3
        I3 = det(A(1:3, 1:3));
        if(I3!=0)
          % Вычисляем определители
          det1 = det(A([1 2], [1 2]));
          det2 = det(A([1 3], [1 3]));
          det3 = det(A([2 3], [2 3]));

          % Вычисляем коэффициенты кубического уравнения
          a = -1;
          b = -(det1 + det2 + det3);
          c = A(1,1) + A(2,2) + A(3,3);
          d = I3;

          % Решаем кубическое уравнение
          roots = roots([a b c d]);
          lam_1 = roots(1);
          lam_2 = roots(2);
          lam_3 = roots(3);
          % Создаем сетку для x и y
         # [x, y] = meshgrid(-2:0.1:2, -2:0.1:2);
          I4 = det(A(1:4, 1:4));
          coef = I4/I3;
           % Создание сетки для x, y
          [x, y] = meshgrid(-10:0.5:10, -10:0.5:10);

          % Вычисление z для каждой точки сетки
          z1 = sqrt(max(0,(-lam_1*x.^2 - lam_2*y.^2 - coef)/lam_3));
          z2 = -sqrt(max(0, (-lam_1*x.^2 - lam_2*y.^2 - coef)/lam_3));

          % Строим гиперболоид
          surf(x, y, z1);
          hold on;
          surf(x, y, z2);
          xlabel('X');
          ylabel('Y');
          zlabel('Z');
          title('Однополостный гиперболоид');
          hold off;
        elseif I3 == 0
             % Вычисляем определители
          det1 = det(A([1 2], [1 2]));
          det2 = det(A([1 3], [1 3]));
          det3 = det(A([2 3], [2 3]));

          % Вычисляем коэффициенты кубического уравнения
          a = -1;
          c = -(det1 + det2 + det3);
          b = A(1,1) + A(2,2) + A(3,3);
          d = I3;

          % Решаем кубическое уравнение
          roots = roots([a b c 0]);
          disp(roots)
          lam_1 = roots(1);
          lam_2 = roots(2);
          #lam_3 = roots(3);
          I4 = det(A(1:4, 1:4));
          det1 = det(A([1 2], [1 2]));
          det2 = det(A([1 3], [1 3]));
          det3 = det(A([2 3], [2 3]));
          I2 = det1 + det2 + det3;
          coef = sqrt(-I4/I2);
          [x, y] = meshgrid(-2:0.2:2, -2:0.2:2);
          z = (-lam_1*x.^2 - lam_2*y.^2)/(2*coef);
          surf(x, y, z);
          hold on;
          xlabel('X');
          ylabel('Y');
          zlabel('Z');
          title('Гиперболический параболоид');
          hold off;

    end
end
