image = zeros(494, 656);
for index  = 1:size(seqX, 1)
    if(seqX(index, 1800) ~= 1)
        for i = 1:1800
        image(seqX(index, i), seqY(index , i)) = 1;
        end
    end
end
imshow(image);