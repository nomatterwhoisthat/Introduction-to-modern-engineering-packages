function chess = fence(r, c)
    if nargin == 1
        c = r; 
    end
    chess = false(r, c);
    chess(:, 1:2:end) = true; 
end
