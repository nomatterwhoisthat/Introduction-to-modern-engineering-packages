function baguett(length, diameter, angle_deg, num_slices)
    % length - длина, diameter - диаметр, angle_deg - угол реза, num_slices - количество кусков
    subplot(1, 2, 1);
    % Создаем цилиндр
    [X, Y, Z] = cylinder(diameter / 2, 32); 
    Z = Z * length;

    % Вращаем цилиндр
    RY = Z;
    RX = X;
    RZ = -Y;

    % Отображаем цилиндр
    hold on;
    surf(RX, RY, RZ, 'facecolor', 'c');

    % Создаем торцы
    theta = linspace(0, 2 * pi, 32); % Углы для создания круга
    X_end = (diameter / 2) * cos(theta);
    Y_end = (diameter / 2) * sin(theta);
    Z_end = zeros(1, numel(X_end)); % Задаем нулевую координату по z для торцов

    % Поворачиваем торцы
    rotation_matrix_end = [cos(pi/2), sin(pi/2); -sin(pi/2), cos(pi/2)];
    rotated_end_points = rotation_matrix_end * [Y_end; Z_end];
    RX_end = X_end;
    RY_end = rotated_end_points(1,:);
    RZ_end = rotated_end_points(2,:);

    % Отображаем торцы
    fill3(RX_end, RY_end, RZ_end, 'b'); % Ближний торец
    fill3(RX_end, RY_end + length, RZ_end, 'c'); % Дальний торец

    % Настройки осей и заголовок
    title('Наш багет');
    axis equal;
    xlabel('X'); ylabel('Y'); zlabel('Z');

    % Создаем второй подграфик для разрезанного багета
    subplot(1, 2, 2);
    hold on;

    % Формируем части цилиндра и перерасчитываем длину
    Z = Z / num_slices;
    % Переводим угол из градусов в радианы
    angle = angle_deg * pi / 180;
    rotation_matrix_slice = [cos(angle), sin(angle); -sin(angle), cos(angle)];

    % Отображаем разрезанный багет
    for i = 1:num_slices
        RY = cos(angle) * Y + sin(angle) * Z;
        RZ = -sin(angle) * Y + cos(angle) * Z;

        rotated_end_points_slice = rotation_matrix_slice * [Y_end; Z_end];
        RY_end = rotated_end_points_slice(1,:);
        RZ_end = rotated_end_points_slice(2,:);

        if mod(i, 2) == 1
            surf(RX, RY + length - i * (length / num_slices), RZ, 'facecolor', 'c');
            fill3(RX_end, RY_end + length - (length / num_slices) * (i - sin(angle)), RZ_end + (length / num_slices) * cos(angle), 'c');
            fill3(RX_end, RY_end + length - i * (length / num_slices) , RZ_end, 'b');
        end
    end

    % Настройки осей и заголовок
    title('Наш разрезанный багет');
    axis equal;
    xlabel('X'); ylabel('Y'); zlabel('Z');
end
%baguett(10, 2, 45, 10);

