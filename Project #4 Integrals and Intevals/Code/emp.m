function f=emp(N)
arr_diff=zeros(N,1);
%Record the difference between empirical and theoretical distribution 
arr_X=zeros(N,1);
arr_X_sorted=zeros(N,1);
%Record the value of X and sorted X
for i=1:N
Z1=randn;
Z2=randn;
Z3=randn;
Z4=randn;
arr_X(i)=Z1.^2+Z2.^2+Z3.^2+Z4.^2;
end
arr_X_sorted = sort(arr_X);

p=[0.25,0.5,0.9];
theo_value=chi2inv(p,4)
expe_value=arr_X_sorted((ceil(N*p)))'
%Find the 25th,50th and 90th percentiles using empirical distribution
for j=1:N
arr_diff(j)=chi2cdf(arr_X_sorted(j),4)-(1/N)*j;
end 
Differ=max((abs(arr_diff)))
%Compute the maximum difference at each of samples
T2=stairs(arr_X_sorted,1/N:1/N:1,'b','linewidth',2);
hold on
t = 0:10^-4:14;
T1=plot(t,chi2cdf(t,4),'r--','linewidth',2);
hold off
grid on
hold off
title('The Distribution of F(x)');
xlabel('The Value of X');
ylabel('The Cumulative Distribution Function of X');
legend([T1,T2],'Theoretical Distribution of F(x)','Empirical Distribution of F(x)');


