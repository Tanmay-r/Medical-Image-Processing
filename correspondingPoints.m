correspondence = zeros(size(points1, 1), 1);
for i = 1:size(points1, 1)
    minr = 100;
    for j = 1:size(points2, 1)
        if (norm(points1(i, :) - points2(j, :)) < minr)
            correspondence(i) = j;
            minr = norm(points1(i, :) - points2(j, :));
        end
    end
end