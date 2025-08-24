function matr = diagsn(n, m)
    if nargin == 1
        m = n;
    end

    num = 1;
    k = 1;
    z = 1;
    direction = 1;
    matr = zeros(n, m, 'uint32');

    while true
        matr(k, z) = num;
        num = num + 1;
        if direction == 1 && k + 1 <= n && z - 1 >= 1 && matr(k + 1, z - 1) == 0
            k = k + 1;
            z = z - 1;
        elseif direction == 1
            if k + 1 <= n
                k = k + 1;
            else
                z = z + 1;
            end
            direction = direction + 1;
        elseif direction == 2 && k - 1 >= 1 && z + 1 <= m && matr(k - 1, z + 1) == 0
            k = k - 1;
            z = z + 1;
        elseif direction == 2
            if z + 1 <= m
                z = z + 1;
            else
                k = k + 1;
            end
            direction = 1;
        end

        if n * m == num - 1
            break;
        end
    end
end
