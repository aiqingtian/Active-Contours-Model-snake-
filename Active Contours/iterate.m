function [newX, newY] = iterate(Ainv, x, y, Eext, gamma, kappa)

[row, col] = size(Eext);

% Get fx and fy
[fx,fy]=gradient(Eext); 

% Iterate
x_ = gamma*x - kappa*interp2(fx,x,y);  
y_ = gamma*y - kappa*interp2(fy,x,y);  
newX = (Ainv * x_')';  
newY = (Ainv * y_')';  

% Clamp to image size
newX(newX>= row) = row -1;
newY(newY>= col) = col -1;
newX(newX<= 0) = 1;
newY(newY<= 0) = 1;
end

