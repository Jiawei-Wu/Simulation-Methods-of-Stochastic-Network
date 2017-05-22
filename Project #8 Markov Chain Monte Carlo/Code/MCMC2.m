clc; clear; close all;

%Simple MC
g = @(x) 4 * cos(pi+sum(5 * (-1+2*x)));
N = 1000; 
U = rand(2,N);
X = g(U); % Simple MC
Integral_MC = mean(X);
Variance_MC = 2*std(X)/sqrt(N);

%Stratified
K = 10; Nij = N/K^2; 
for i = 1:K
for j = 1:K
XS = g([i-1+rand(1,Nij);j-1+rand(1,Nij)]/K);
XSb(i,j) = mean(XS); 
SS(i,j) = var(XS);
end
end
SST = mean(mean(SS/N));
Integral_Stratified = mean(mean(XSb));
Variance_Stratified = 2*sqrt(SST);

%Important sampling
e = exp(1); 
X = log(1+(e-1)*U);
T = (e-1)^2 * (4*cos(pi+sum(5 * (-1+2*X))))./3;
Integral_Importsamping = mean(T);
Variance_Importsampling = 2*std(T)/sqrt(N);