function f=accep(N)
p = [6 6 6 6 6 15 13 14 15 13]/100; 
c=max(p)/0.05;%Calculate the value of constant c 
for i = 1:N, k = 0;
    while 1
        k = k + 1;
        j = 1 + floor(20*rand);%Get random number of j
        if j<=10
            if 3*rand < p(j)/0.05 %If (c*u)<=p(i)/0.05, accept p(j)
                X(i) = j; C(i) = k;%Obtain the accepted samples. 
                break
            end
        end
    end
end
Test_Mean=mean(X)
Theo_Mean=1*0.06+2*0.06+3*0.06+4*0.06+5*0.06+6*0.15+7*0.13+8*0.14+9*0.15+10*0.13
Test_Variance=var(X)
Theo_Variance=1/N*sum((X-Theo_Mean).^2)
%Calculate the test and theoretical mean and variance for accpeted samples.
Mu_C=mean(C);
Theo_Effiency=1/c
Test_Effiency=1/Mu_C
%Calculate the test and theoretical efficiency.
hist(X);%Generate a histogram to show the accepted samples.
hold on
x=1:10;
T1=plot(x,p*N,'r+','markersize',15);%Overlay the histogram with the target distribution p(j)
title('Histogram for the Distribution');
xlabel('Number of Outcomes');
ylabel('Quantity of Occurence Times');
legend([T1],'Distribution of P(j)');
hold off
