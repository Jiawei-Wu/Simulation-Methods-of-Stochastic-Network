function f=xiugai(N)
A = zeros(1,60);
Count=0;
arr_Count=zeros(1,N);
for j=1:N
data_label=0;  
while 1
    Count=Count+1;
    data = rand;
        for i=1:60
            A(i)=0.2137/i;
                if data < A(i)
                    data_label = i;
                    break
                end
        end
    if data_label == 60
        break
    end
end
arr_Count(j)=Count;
end
hist(arr_Count);