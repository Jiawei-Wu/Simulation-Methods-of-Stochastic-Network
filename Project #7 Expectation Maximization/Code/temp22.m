N=100000;%N represents the sample size
A=zeros(N,1);
%Generate mixture distribution by looping and comparing random numbers
%with P=0.4
for i=1:N
u=rand;
if u<0.4
    A(i)=normrnd(-1,1);
else
    A(i)=normrnd(1,1);
end
end
%Generate theoretical nromal distribution
x=-5:0.01:5;
B=0.4*normpdf(x,-1,1)+0.6*normpdf(x,1,1);

%Plot the histogram
histogram(A,'BinLimits',[-1,1],'Normalization','probability')
%hist(A);
hold on;
T1=plot(x,B*N,'-r','LineWidth', 3);
title('Histogram for the Random Variable');
xlabel('The Values of Random Variable');
ylabel('The Occurence Times');
legend([T1],'p.d.f. of Theoretical Distribution');
hold off;
