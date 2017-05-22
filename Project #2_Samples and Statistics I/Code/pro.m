function f=pro(N)%N represents the number of a sample
alpha=0.05;
arr_Mu=zeros(1,N);
arr_Std=zeros(1,N);%Create two arrays to store means and standard deviations of different samples
Rand_Num=randi([-3 2],1,N);
x=-3:1:2;
figure(1);
hist(Rand_Num,x);%Generate a histogram of the sampling outcome
title('Histogram of Sampling Outcome')
xlabel('Numbers in the Sample');
ylabel('Quantity of Numbers')
theo_Mu=(-3+2)/2
sample_Mu1=mean(Rand_Num)
theo_var=(2-(-3))^2/12
sample_var=var(Rand_Num)%Compare experimental values to theoretical values
for i=1:N
Rand_Ind=randi([1 N],1,N);%Every loop,choose different individuals from original sample
Rand_Sel=Rand_Num(:,Rand_Ind);%Resample with same amount and differnent individuals
sample_Mu=mean(Rand_Sel);
arr_Mu(i)=sample_Mu;
sample_Std=std(Rand_Sel);
arr_Std(i)=sample_Std;%Store different values of mean and std in arrays
end

c=sort(arr_Mu);
Mu_X1=prctile(arr_Mu,2.5)
Mu_X2=prctile(arr_Mu,97.5)%show the width of boostrap confidence interval for sample mean
CI = prctile(c,[100*alpha/2,100*(1-alpha/2)]);%Define the confidence interval
figure(2);
hist(c);
hold on;
T1=plot([CI(1),CI(1)], get(gca, 'YLim'), '-r', 'LineWidth', 3) % 红色，宽度为3
T2=plot([CI(2),CI(2)], get(gca, 'YLim'), '-y', 'LineWidth', 3) % 红色，宽度为3
hold off;
title('Bootstrap Confidence Interval for Sample Mean');
xlabel('Mean of Samples');
ylabel('Quantity of Mean');
legend([T1,T2],'2.5% Sample Mean','97.5% Sample Mean');

d=sort(arr_Std);
Std_X1=prctile(arr_Std,2.5)
Std_X2=prctile(arr_Std,97.5)%show the width of bootstrap confidence interval for the sample standard deviation
CII = prctile(d,[100*alpha/2,100*(1-alpha/2)]);
figure(3);
hist(d);
hold on;
P1=plot([CII(1),CII(1)], get(gca, 'YLim'), '-r', 'LineWidth', 2) % 红色，宽度为3
P2=plot([CII(2),CII(2)], get(gca, 'YLim'), '-y', 'LineWidth', 2) % 红色，宽度为3
hold off;
title('Bootstrap Confidence Interval for Sample Standard Deviation');
xlabel('Standard Deviation of Samples');
ylabel('Quantity of Standard Deviation');
legend([P1,P2],'2.5% Sample Std','97.5% Sample Std');