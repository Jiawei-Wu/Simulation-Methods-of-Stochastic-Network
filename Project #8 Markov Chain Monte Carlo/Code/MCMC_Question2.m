clc;
clear;
%Simple MC
g = @(x)exp(sum(5 * abs(x - 5)));
N = 1000; 
X = g(rand(2,N)); % Simple MC
Integral_MC = mean(X);
Variance_MC = 2*std(X)/sqrt(N);

%Stratified
K = 10; 
Nij = N/K^2; % Stratified
for i = 1:K
for j = 1:K
XS = g([i-1+rand(1,Nij);j-1+rand(1,Nij)]/K);
XSb(i,j) = mean(XS); 
SS(i,j) = var(XS);
end
end
SST = mean(mean(SS/N));
%MCSS = ([mean(mean(XSb)) 2*sqrt(SST) ]);
Integral_Stratified = mean(mean(XSb));
Variance_Stratified = 2*sqrt(SST);

%Important sampling
N = 1000; 
U = rand(2,N); 
e = exp(1); 
X = log(1+(e-1)*U);
T = (e-1)^2*exp(sum(5 * abs(X - 5))-sum(abs(X)));
%MCIS = ([mean(T) 2*std(T)/sqrt(N)]);
Integral_Importsamping = mean(T);
Variance_Importsampling = 2*std(T)/sqrt(N);


