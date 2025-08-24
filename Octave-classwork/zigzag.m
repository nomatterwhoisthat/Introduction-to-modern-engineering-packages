function matr = zigzag(n)
    num = 1;
    k = 1;
    z = 1;
    direction = 1;
    matr = -1*ones(n, n);
    matr(k, z) = num;
    num++;
    z++;

    while (true)
        if (direction == 1 && k + 1 <= n && z - 1 >= 1 && matr(k+1, z-1) == -1)
            matr(k, z) = num;
            num++;
            k++;
            z--;
        elseif (direction == 1)
            matr(k, z) = num;
            num++;
            if (k + 1 <= n && matr(k+1, z) == -1)
                k++;
            else
                z++;
            endif
            direction++;
        elseif (direction == 2 && k - 1 >= 1 && z + 1 <= n && matr(k-1, z+1) == -1)
            matr(k, z) = num;
            num++;
            k--;
            z++;
        elseif (direction == 2)
            matr(k, z) = num;
            num++;
            if (z + 1 <= n && matr(k, z+1) == -1)
                z++;
            else
                k++;
            endif
            direction = 1;
        endif

        if (n * n == num)
            matr(k, z) = num;
            break;
        endif
    end
end
