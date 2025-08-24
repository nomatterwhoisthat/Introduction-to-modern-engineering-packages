function chess = chess1(n, m)
    % по заданному количеству строк и столбцов генерится логическая матрица
    % с чередующимися строками и столбцами
    chess = false(n, m);
    chess(1:2:end , 1:2:end) = true;
    chess(2:2:end , 2:2:end) = true;
end
