image = zeros(494, 656);
for i = 1:1800
    image(seqX(27, i), seqY(27 , i)) = 1;
end
imshow(image);