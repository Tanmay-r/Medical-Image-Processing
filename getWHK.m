Ax = zeros(1800, 3);
Ay = zeros(1800, 3);
Bx = zeros(1800, 1);
By = zeros(1800, 1);
index = 19;
for i = 1:1800
    Ax(i, 1) = 1;
    Ax(i, 2) = cos(i/30);
    Ax(i, 3) = - sin(i/30);
    Bx(i) = seqX(index, i);
    
    Ay(i, 1) = 1;
    Ay(i, 2) = cos(i/30);
    Ay(i, 3) = sin(i/30);
    By(i) = seqY(index, i);
end

answer = linsolve(Ax, Bx);
h = answer(1);
w1 = answer(2);
w2 = answer(3);

answer = linsolve(Ay, By);
k = answer(1);
w3 = answer(2);
w4 = answer(3);