clearvars
load('C:\Users\tanmay\Downloads\Medical Image Processing\project\input\imagesfl60.mat')
numHistory = 1800;

index = 1;
thresholding;

seqX = zeros(numPoints, numHistory);
seqY = zeros(numPoints, numHistory);
Vx = zeros(numPoints, 1);
Vy = zeros(numPoints, 1);

for i = 1:numPoints
    seqX(i,1) = point(i, 1);
    seqY(i,1) = point(i, 2);
    Vx(i) = 1;
    Vy(i) = 1;
end
numPoints1 = numPoints;
for index = 2:1800
    index
    thresholding;
    
    for i = 1:numPoints1
        minr = 100;
        for j = 1:size(point, 1)
            distance = (seqX(i, index - 1) - point(j, 1))^2  + (seqY(i, index - 1) - point(j, 2))^2;
            if (distance < minr)
                seqX(i,index) = point(j, 1);
                seqY(i,index) = point(j, 2);
                minr = distance;
            else
                if (distance == minr)
                    distance1 = (seqX(i,index) - seqX(i,index - 1) - Vx(i))^2 + (seqY(i,index) - seqY(i,index - 1) - Vy(i))^2;
                    distance2 = (seqX(i,index) - point(j, 1) - Vx(i))^2 + (seqY(i,index) - point(j, 2) - Vy(i))^2;
                    if(distance2 < distance1)
                        seqX(i,index) = point(j, 1);
                        seqY(i,index) = point(j, 2);
                    end
                end
            end
        end
        Vx(i) = seqX(i,index) - seqX(i,index - 1);
        Vy(i) = seqY(i,index) - seqY(i,index - 1);
    end
end
