%ellipse = imagesfl60(1,:, :);
ellipse = zeros(400, 600);
for theta = 0:180
    i = h + a_final*cos(theta)*cos(alpha) - b_final*sin(theta)*sin(alpha);
    j = k + a_final*cos(theta)*sin(alpha) + b_final*sin(theta)*cos(alpha);
    ellipse(floor(i), floor(j)) = 255;
end