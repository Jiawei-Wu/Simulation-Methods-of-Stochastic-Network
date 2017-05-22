function f=b(N)
alpha=0.05;
arr_Mu=zeros(1,N);
for j=1:N
Rand_Num=rand(1,N);
X_k=zeros(1,N-1);
for i=1:N-1
X_k(i)=Rand_Num(i);%Sequence X_k contains random number range from the first to the penultimate.
end
X_k1=zeros(1,N-1);%Sequence X_k1 contains random number range from the second to the last.
for i=2:N
X_k1(i-1)=Rand_Num(i);%Sequence X_k and X_k1 have the same length
end
Cov_Num=cov(X_k,X_k1);
t=Cov_Num(1,2);%Calculate the correlation coefficent
arr_Mu(j)=t;
end
c=mean(t)
c=sort(arr_Mu);
Mu_X1=prctile(arr_Mu,2.5)
Mu_X2=prctile(arr_Mu,97.5)%show the width of boostrap confidence interval for sample mean
CI = prctile(c,[100*alpha/2,100*(1-alpha/2)]);%Define the confidence interval
figure(2);
hist(c);
hold on;
T1=plot([CI(1),CI(1)], get(gca, 'YLim'), '-r', 'LineWidth', 3) % ?им?????ик????3
T2=plot([CI(2),CI(2)], get(gca, 'YLim'), '-y', 'LineWidth', 3) % ?им?????ик????3
hold off;
title('Bootstrap Confidence Interval for Correlation Coefficient');
xlabel('Different value of Correlation Coefficients');
ylabel('Quantity of Correlation Coefficients');
legend([T1,T2],'2.5% coefficient','97.5% coefficient');


