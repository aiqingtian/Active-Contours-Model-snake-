function [x, y] = initializeSnake(I)

% Show figure
imshow(I);
[x_size,y_size] = size(I);

% Get initial points
[x_, y_] = getpts();
xy = [x_';y_'];
xy_size = size(xy')+1;
xy = [xy, xy(:,1)];
m = 1:xy_size;

% Interpolate
pp = spline(m, xy);
tInterp = linspace(1, numel(xy(1,:)));
xyInterp = ppval(pp, tInterp);
xspline = xyInterp(1,:);
yspline = xyInterp(2,:);

% Clamp points to be inside of image
xspline(xspline>=x_size)= x_size-1;
yspline(yspline>=y_size)= y_size-1;
x = xspline;
y = yspline;

% Draw the init_snake
% hold on;
% plot(x_, y_, 'o', x, y, 'b.')
end

