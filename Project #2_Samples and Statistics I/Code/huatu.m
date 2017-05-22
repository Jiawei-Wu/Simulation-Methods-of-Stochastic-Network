function f=huatu(N)
x = randi([0 9],1,N);
t=0:1:9;
hist(x,t);%Generate a histogram to show the sample
xlabel('Numbers in the Sample');
ylabel('Quantity of Numbers');
title('Histogram of Sampling Outcome');
x_theo = N*[1/10, 1/10, 1/10, 1/10, 1/10, 1/10, 1/10, 1/10, 1/10, 1/10];
a=zeros(0,9);
for i=1:10
    a(i)=sum(x==(i-1));%Calculate the quantity of each number ranging from 0-9 in the sample
end
Chi_Test = sum((a-x_theo).^2./x_theo)%calculate the experimental Chi-square test statistic value
Chi_Threshold = chi2inv(0.95,9)%Return the standard value of Chi-square test with probability of 95% and 9-degrees freedom.

b=a(1,2:10);
c=[b 0];%Replace the sample to judge whether the same data fit the alternative uniform distribution ranging from 0 to 9
Chi_TestC = sum((c-x_theo).^2./x_theo)

t=0:1:N;
plot(t,Chi_Threshold,'+')
hold on
plot(t,Chi_Test,'.')
hold on
plot(t,Chi_TestC,':')
xlabel('x')
ylabel('y')
legend('自由度n=1','自由度n=2','自由度n=10')