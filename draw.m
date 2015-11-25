image = zeros(494, 656);
for i = 1:1800
    image(seqX(35, i), seqY(35 , i)) = 1;
end
imshow(image);