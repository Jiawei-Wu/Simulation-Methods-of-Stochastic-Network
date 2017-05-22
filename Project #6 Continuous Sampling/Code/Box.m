
N=1000;
M1 = 1; % Mean of X
M2 = 2; % Mean of Y
V1 = 4; % Variance of X
V2 = 9; % Variance of Y

u1 = rand(N,1);
u2 = rand(N,1);

% Geberate X and Y that are N(0,1) random variables and independent
X = sqrt( - 2*log(u1)).*cos(2*pi*u2 ); 
Y = sqrt( - 2*log(u1)).*sin(2*pi*u2 );

% Scale them to a particular mean and variance 
x = sqrt(V1)*X + M1; % x~ N(M1,V1)
y = sqrt(V2)*Y + M2; % y~ N(M2,V2)
 
A=x+y;
exp_mean=mean(A)
exp_variance=var(A)
temp=cov(x,y);
Covariance=temp(1,2)

i=min(A);
j=max(A);
hist(A,[j-i+1]);
hold on

t=i:j;
R=normpdf(t,3,sqrt(13));
M=R*N;
T1=plot(t,M,'-r','LineWidth', 3);
title('Histogram for Variable A by Box Muller Method (Sample=1000)');
xlabel('The Value of A');
ylabel('The Occurence of Different A');
legend([T1],'p.d.f. of Theoretical Distribution');
hold off


