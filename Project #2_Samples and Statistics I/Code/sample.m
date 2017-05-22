function f=sample(N)
Rand_Num=randi([-3 2],1,N);
x=-3:1:2;
hist(Rand_Num,x);
title('Histogram of Sampling Outcome')
xlabel('Numbers in the Sample');
ylabel('Quantity of Numbers')
theo_Mu=(-3+2)/2
sample_Mu1=mean(Rand_Num)
theo_var=(2-(-3))^2/12
sample_var=var(Rand_Num)