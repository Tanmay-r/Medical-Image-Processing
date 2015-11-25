function [images] = readRawFile(filename)
    rows = 494;
    columns = 656;
    numImages = 1800;
    
    images = zeros(numImages, rows, columns, 'uint8');
    
    fin = fopen(filename, 'r');
    for i=1:numImages
        I=fread(fin, rows*columns,'uint8=>uint8'); 
        Z=reshape(I, columns, rows);
        Z = Z';
        images(i,:,:) = Z;        
        imshow(Z);
        i
    end
end

