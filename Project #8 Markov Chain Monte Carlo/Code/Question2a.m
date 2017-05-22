clc; clear; close all;

N = 10000; 
n = 3; 
c = 15; 
X = ones(1,n); % Initial X
for m = 1 : N
  i = ceil(n*rand);   % random coordinate index i
  S = sum(X) - X(i);
  X(i) = max(c-S,0) - log(rand)/i; % new X(i)
  H(m) = S + i * X(i); % new sum for state m
end
gibs = ([mean(H) 2*std(H)/sqrt(N)]);

N = 10000000;
XR = -diag(1./(1:n))*log(rand(n,N));
S = sum(XR); 
H = S.*(S>15)/mean(S>15);
MC = ([mean(H) 2*std(H)/sqrt(N)]);
Expectation = mean(H)