clear; clc; close all;
sum=0;
for i=1:60
    a_a=1/i;
    sum=sum+a_a;
end
a_Value = 1/sum;
count = zeros(1, 60);

stopcond =0;
while stopcond ==0
    data = rand;
    j=1;
    b = a_Value;
    stopcond2 = 0;
    while stopcond2 == 0
        if data < b
            count(j) = count(j) + 1;
            stopcond2 =1;
        else
            j = j+1;
            b=b+0.2137/j;
        end
    end
    if j == 60
        stopcond =1;
    end
end
bar(1:60, count);