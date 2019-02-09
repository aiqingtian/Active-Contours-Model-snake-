clear all;
clc;
close all;
% Parameters (play around with different images and different parameters)
% Brain
% N = 1000;
% alpha = 0.10;
% beta = 0.25;
% gamma = 0.75;
% kappa = 1.25;
% Wline = 0.5;
% Wedge = 1.0;
% Wterm = 0.5;
% sigma = 0.5;

% % Brain
% N = 300;
% alpha = 0.10;
% beta = 0.25;
% gamma = 1.0;
% kappa = 1.25;
% Wline = 0.1;
% Wedge = 0.5;
% Wterm = 0.1;
% sigma = 0.5;


% Circle Square and vase
% N = 700;
% alpha = 0.05;
% beta = 0.20;
% gamma = 1.0;
% kappa = 0.1;
% Wline = 0.1;
% Wedge = 1.0;
% Wterm = 0.1;
% sigma = 0.5;


% shape
% N = 700;
% alpha = 0.01;
% beta = 0.20;
% gamma = 2.0;
% kappa = 0.1;
% Wline = 0;
% Wedge = 1.4;
% Wterm = 0;
% sigma = 1.0;

% Dense Points for Star and brain and dental
N = 500;
alpha = 0.01;
beta = 0.01;
gamma = 1.5;
kappa = 0.1;
Wline = 0;
Wedge = 0.4;
Wterm = 0;
sigma = 1.0;


% Load image
% I = imread('images/square.jpg');
% I = imread('images/brain.png');
I = imread('images/brain.png');

if (ndims(I) == 3)
    I = rgb2gray(I);
end

% Load image
% I = imread('images/dental.png');
% if (ndims(I) == 3)
%     I = rgb2gray(I);
% end

% Initialize the snake
[x, y] = initializeSnake(I);
% Calculate external energy
I_smooth = double(imgaussfilt(I, sigma));
Eext = getExternalEnergy(I_smooth,Wline,Wedge,Wterm);

% Calculate matrix A^-1 for the iteration
% Ainv = getInternalEnergyMatrix(size(x,2), alpha, beta, gamma);
Ainv = getInternalEnergyMatrixBonus(size(x,2), alpha, beta, gamma);

% Iterate and update positions
displaySteps = floor(N/10);
for i=1:N 
    % Iterate
    [x,y] = iterate(Ainv, x, y, Eext, gamma, kappa);
    
    % Plot intermediate result
    subplot(1, 2, 2)
    imshow(I); 
    hold on;
    x_ = x;y_ = y;
    plot([x_ x_(1)], [y_ y_(1)], 'r');
        
    % Display stepx
    if(mod(i,displaySteps)==0)
        fprintf('%d/%d iterations\n',i,N);
    end
    pause(0.0001)
end
 
if(displaySteps ~= N)
    fprintf('%d/%d iterations\n',N,N);
end