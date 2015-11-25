clearvars

%Params
a = 2;
b = 1;
c = 1;
d = 0;
e = 0;
offset = 5;

load('C:\Users\tanmay\Downloads\Medical Image Processing\project\input\imagesfl60.mat')
numHistory = 1800;

index = 1;
thresholding;

seqX = zeros(numPoints, numHistory);
seqY = zeros(numPoints, numHistory);
Vx = zeros(numPoints, 1);
Vy = zeros(numPoints, 1);
I = zeros(numPoints, 1);

newImage(:,:) = imagesfl60(1,:, :);
for i = 1:numPoints
    seqX(i,1) = point(i, 1);
    seqY(i,1) = point(i, 2);
    Vx(i) = 1;
    Vy(i) = 1;
    I(i) = newImage(point(i, 1), point(i, 2));
end

for index = 2:1800
    index
    newImage(:,:) = imagesfl60(index,:, :);
    level = graythresh(newImage);
    bw = im2bw(newImage,level);
    newImage = newImage.*uint8(bw);
    for i = 1:numPoints
        minE = 10000;
        for j = seqX(i, index - 1) - offset:seqX(i, index - 1) + offset
            if (j > 0) && (j < size(newImage, 1))
                for k = seqY(i, index - 1) - offset:seqY(i, index - 1) + offset
                    if (k > 0) && (k < size(newImage, 2))
                        intensityDiff = double(I(i) - newImage(j, k)*1.0)^2;
                        xDiff = double(seqX(i, index - 1) - j)^2;
                        yDiff = double(seqY(i, index - 1) - k)^2;
                        vxDiff = 0;
                        vyDiff = 0;
                        if (xDiff > 0)
                            vxDiff = double((j - seqX(i, index - 1))/sqrt(xDiff) - Vx(i))^2;
                        end
                        if(yDiff > 0)
                            vyDiff = double((k - seqY(i, index - 1))/sqrt(yDiff) - Vy(i))^2;
                        end
                        E = a*intensityDiff + b*xDiff + c*yDiff + d*vxDiff + e*vyDiff;
                        if(E < minE)
                            seqX(i, index) = j;
                            seqY(i, index) = k;
                            minE = E;
                        end
                    end
                end
            end
            if(seqX(i, index) ~= 0)
                xDiff = (seqX(i, index - 1) - seqX(i, index))^2;
                yDiff = (seqY(i, index - 1) - seqY(i, index))^2;
                if(xDiff > 0)
                    Vx(i) = (seqX(i, index) - seqX(i, index - 1))/sqrt(xDiff);
                end
                if(yDiff > 0)
                    Vy(i) = (seqY(i, index) - seqY(i, index - 1))/sqrt(yDiff);
                end
                I(i) = newImage(seqX(i, index) , seqY(i, index));
            else
                seqX(i, index) = seqX(i, index - 1);
                seqY(i, index) = seqY(i, index - 1);
                Vx(i) = Vx(i);
                Vy(i) = Vy(i);
            end
        end
    end
end
