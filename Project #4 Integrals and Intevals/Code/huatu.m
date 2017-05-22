clear; clc; close all;
N=10000;
arr_X=zeros(N,1)
for i=1:N
Z1=randn;
Z2=randn;
Z3=randn;
Z4=randn;
arr_X(i)=Z1.^2+Z2.^2+Z3.^2+Z4.^2;
end
figure;
arr_X = sort(arr_X);
y = sort(chi2cdf(1:N,4));
stairs(arr_X,1/N:1/N:1,'b','linewidth',2);

% plot(t,1-exp(-lambda*t),'r--','linewidth',2);

% figure;
% cdfplot(arr_X);
% hold on;
% % grid on;
% plot(linspace(1,25,N),y);