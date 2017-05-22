function f=empri(N)
arr_cha=zeros(N,1);
arr_X=zeros(N,1);
arr_X1=zeros(N,1);
for i=1:N
Z1=randn;
Z2=randn;
Z3=randn;
Z4=randn;
arr_X(i)=Z1.^2+Z2.^2+Z3.^2+Z4.^2;
end
arr_X1 = sort(arr_X);

p=[0.25,0.5,0.9];
theo_value=chi2inv(p,4)
expe_value=arr_X1((ceil(N*p)))


for j=1:N
arr_cha(j)=chi2cdf(arr_X1(j),4)-(1/N)*j;
end 
% for j=1:N
% arr_cha(j)=chi2cdf(arr_X1(j),4)-(1/N)*j;
% end 
% for j=1:10
%     arr_cha(j)=j*0.1-chi2cdf(j,4)
% end
Differ=max((abs(arr_cha)))
% figure;
arr_X = sort(arr_X);
y = sort(chi2cdf(1:N,4));
stairs(arr_X,1/N:1/N:1,'b','linewidth',2);

% plot(t,1-exp(-lambda*t),'r--','linewidth',2);

% figure;
hold on;
t = 0:10^-4:16;
plot(t,chi2cdf(t,4),'r--','linewidth',2);
grid on

% cdfplot(arr_X);
% hold off
% grid on;
% % plot(linspace(1,25,N),y);