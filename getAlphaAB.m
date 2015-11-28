minError = 1000;

for alpha_iter = 0:180
    for theta_iter = 0:180
        a = (w2*cos(alpha_iter) - w4*sin(alpha_iter))/sin(theta_iter);
        b = (w3*cos(alpha_iter) - w1*sin(alpha_iter))/sin(theta_iter);
        err = 0;
        err = err + (a*cos(alpha_iter)*cos(theta_iter) - b*sin(alpha_iter)*sin(theta_iter) - w1)^2;
        err = err + (a*cos(alpha_iter)*sin(theta_iter) + b*sin(alpha_iter)*cos(theta_iter) - w2)^2;
        err = err + (a*sin(alpha_iter)*cos(theta_iter) + b*cos(alpha_iter)*sin(theta_iter) - w3)^2;
        err = err - (a*sin(alpha_iter)*sin(theta_iter) + b*cos(alpha_iter)*cos(theta_iter) - w4)^2;
        if(err < minError)
            minError = err;
            alpha = alpha_iter;
            a_final = a;
            b_final = b;
        end
    end
end