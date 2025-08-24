function matrix = circle(n, r)
  matrix = false(n, n);
  center = (n+1)/2;
  for i = 1:n
    for j = 1:n
      if sqrt((i-center)^2 + (j-center)^2) <= r
        matrix(i, j) = true;
      end
    end
  end
end
