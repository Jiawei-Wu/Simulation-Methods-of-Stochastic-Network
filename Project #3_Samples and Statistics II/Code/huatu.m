function f=huatu(N)
sum=0;
for i=1:60
    a_a=1/i;
    sum=sum+a_a;
end
a_Value = 1/sum;
% A = zeros(1,60);
% A(1) = a_Value;
% for i=2:60
%     A(i)=A(i-1)+0.2137/i;
% end
% bar(A);
% title('Histogram for the Sequence');
% xlabel('The Number of j');
% ylabel('The Probability of P(j)');

B = zeros(1,60);
arr_Count=zeros(1,N);
Count=0;
for k=1:N
    B(1) = a_Value;
    sss = 0;
    while sss == 0
        Count=Count+1;
        data = rand;
        for j=2:60
            B(j)=B(j-1)+0.2137/j;
            if data < B(j)
                data_label = j;
                break
            end
        end
        if data_label == 60
            sss = 1;
        end
    end
    arr_Count(k)=Count;
    Count=0;
end
Test_Mu_Count=mean(arr_Count);
Test_Var_Count=var(arr_Count);
disp(Test_Mu_Count);
disp(Test_Var_Count);
hist(arr_Count);
