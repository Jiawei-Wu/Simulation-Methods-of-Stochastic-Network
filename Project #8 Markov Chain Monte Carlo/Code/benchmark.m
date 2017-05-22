clc; clear; close all;
% Generate a row vector of 100 linearly equally spaced points between -500
% and 500
x = linspace(-500,500,100); 
y = linspace(-500,500,100);
% Obtain 100x100 pairs of points in matrix form from vectors x and y
[X1,X2] = meshgrid(x,y); 
d = 2;
f_X1 = 418.9829 * d - 1 * X1 .* sin(sqrt(abs(X1)));
f_X2 = 418.9829 * d - 1 * X2 .* sin(sqrt(abs(X2)));
f = f_X1 + f_X2;
G_min = min(min(f));
X1_min = min(min(f_X1));
X2_min = min(min(f_X2));

figure(1)
contour(X1,X2,f); % Plot a contour plot
colorbar;
title('The Contour Plot');
figure(2)
mesh(X1,X2,f); % Plot a mesh plot
colorbar;
xlim([-500 500]);
ylim([-500 500]);
title('The Mesh plot');