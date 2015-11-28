image = zeros(494, 656);
index = 19;
for i = 1:1800
    image(seqX(index, i), seqY(index , i)) = 1;
end
imshow(image);