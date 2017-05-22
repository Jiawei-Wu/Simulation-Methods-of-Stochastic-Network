%%Stratified sampling
g = @(x)exp(sum(5*abs(x-5)));
N = 1000;
X = g(rand(2,N)); % Simple MC
result_a1=([mean(X) 2*std(X)/sqrt(N)])

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
result_a2=([mean(mean(XSb)) 2*sqrt(SST) ])

%Importance sampling
N = 1000;
U = rand(2,N);
T = exp(sum(5*abs(U-5)));
result_b1=( [mean(T) 2*std(T)/sqrt(N)]) % simple MC
e = exp(1);
X = log(1+(e-1)*U);
T = (e-1)^2*exp(sum(X).^2-sum(X));
result_b2=( [mean(T) 2*std(T)/sqrt(N)])


