%Image 1
I(:, :) = imagesfl60(index,:, :);
%imshow(I)
level = graythresh(I);
bw = im2bw(I,level);
numPoints = sum(bw(:));
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