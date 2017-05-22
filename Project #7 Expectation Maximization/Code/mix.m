clear all;
clc;
close all;
% first distribution is centered at (0,0), second at (-1,3)
mu = [1 2;-3 -5];
% covaraiance matrix 
sigma = cat(3,[2 0;0 .5],[1 0;0 1]);
% weight
p = [0.5,0.5];
% build GMM
obj = gmdistribution(mu,sigma,p);

% 2D projection
figure;
ezcontourf(@(x,y) pdf(obj,[x y]));

% view PDF surface
%figure;
%ezsurf(@(x,y)pdf(obj,[x y]),[-10 10],[-10 10])