function res = checkerboard(r,c)
# формирует по заданному количеству строк и столбцов логическую матрицу - аналог шахматной доски
 if nargin == 1
        c = r
 endif
    res = false(r, c);
    res(1:2:end, 1:2:end) = true ; # Для нечетных строк и столбцов
    res(2:2:end, 2:2:end) = true; # Для четных строк и столбцов
end


