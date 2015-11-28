%Image 1
I(:, :) = imagefl60(index,:, :);
%imshow(I)
level = graythresh(I);
bw = im2bw(I,level);
numPoints = sum(bw(:));
while numPoints > 200
    level = level + 0.01;
    bw = im2bw(I, level);
    numPoints = sum(bw(:));
end 
%imshow(bw)

point = zeros(numPoints, 2);
x = 1;
for i = 1:size(bw, 1)
    for j = 1:size(bw, 2)
        if bw(i, j)
            point(x, :) = [i, j];
            x = x + 1;
        end
    end
end