function f=sequ(N)
sum=0;
for i=1:60
    a_a=1/i;
    sum=sum+a_a;
end
a_Value = 1/sum;%Calculate the constant "p" through normalization
count = zeros(1, 60);

stopcond =0;%Set the stop condition for the "while" loop
while stopcond ==0
    data = rand;
    j=1;
    b = a_Value;%The probability for 1 to appear is equal to "a_Value"
    stopcond2 = 0;
    while stopcond2 == 0
        if data < b
            count(j) = count(j) + 1;%Get and store the Xk according to the probability interval
            stopcond2 =1;%Terminate the inner loop when confirm the value of Xk
        else
            j = j+1;
            b=b+0.2137/j;%Obtain the probability interval using cdf
        end
    end
    if j == 60
        stopcond =1;%Terminate the outer loop if Xk=60. 
    end
end
figure(1);
bar(1:60, count);%Generate a histogram to show Xk until first 60 appearing.
title('Histogram for the Sequence of X');
xlabel('Number of Sequence X');
ylabel('Quantity of Occurence Times');

B = zeros(1,60);
arr_Number=zeros(1,N);
p=a_Value/60;%Calculate the probability that 60 appears.
Number=0;%Reset the counter that counts the total times until first 60 appears.
for k=1:N
    B(1) = a_Value;
    stopcond3 = 0;
    while stopcond3 == 0
        Number=Number+1;%Counter added one for each loop and check whether the number obtained is 60.
        data = rand;
        for j=2:60
            B(j)=B(j-1)+0.2137/j;
            if data < B(j)
                data_label = j;%Get the value of number according to the probability inerval using cdf
                break
            end
        end
        if data_label == 60
            stopcond3 = 1;%Terminate the "while" loop if the first 60 appears
        end
    end
    arr_Number(k)=Number;%Store the value of counter in each experiment into an array.
    Number=0;%Reset the counter
end
figure(2);
hist(arr_Number);%Generate a histogram to show the times of trials repeated until the first 60 appears
title('Histogram for the Variable of N');
xlabel('Number of Experiments');
ylabel('Quantity of Occurence Times');
Test_Mean=mean(arr_Number) %Obtain the test mean of total experiment times to get the first 60
Theo_Mean=1/p %Calculate the theoretical mean in geometric distribution
Test_Variance=var(arr_Number) %%Obtain the test variance of total experiment times to get the first 60
Theo_Variance=(1-p)/p^2 %Calculate the theoretical variance in geometric distribution



